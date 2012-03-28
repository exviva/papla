require 'bigdecimal'
require 'bigdecimal/util'
require 'papla/backend'
require 'papla/version'

module Papla
  # Converts a number to Polish or English words,
  # capitalizing the first letter of the whole phrase.
  #
  # Localisation is provided by <tt>I18n</tt>, the language
  # of the result depends on <tt>I18n.locale</tt>.
  #
  # Currently numbers from 0 up to 999 999 999
  # are supported. If you pass a bigger number,
  # an <tt>ArgumentError</tt> is raised.
  #
  # To convert a number, simply call:
  #
  #   Papla[your_number]
  #
  # Examples:
  #
  #   I18n.locale # => :pl
  #   Papla[0] # => "Zero"
  #   Papla[22] # => "Dwadzieścia dwa"
  #   Papla[150] # => "Sto pięćdziesiąt"
  #   Papla[999] # => "Dziewięćset dziewięćdziesiąt dziewięć"
  #   Papla[12345] # => "Dwanaście tysięcy trzysta czterdzieści pięć"
  #   Papla[1_000_001] # => "Jeden milion jeden"
  #
  # When given a <tt>Float</tt>, Papla will assume that
  # the decimal part represents cents. It will then
  # round the number using <tt>Float#round</tt> to
  # two decimal places, and append the number
  # of cents divided by hundred to the resulting string.
  #
  # Example:
  #
  #   Papla[1.0] # => "Jeden 00/100"
  #   Papla[87.654321] # => "Osiemdziesiąt siedem 65/100"
  #   Papla[2.999] # => "Trzy 00/100"
  #
  # @param [Fixnum] number the number to convert
  # @return [String] the phrase in Polish or English
  def self.[](number)
    validate!(number)
    number = prepare(number)
    basic_number = number.to_i
    basic_phrase = build_basic_phrase(basic_number)

    case number
    when Float; append_cents(basic_phrase, number)
    else basic_phrase
    end
  end

  private

  def self.prepare(number)
    case number
    when Float; number.round(2)
    else number
    end
  end

  def self.build_basic_phrase(basic_number)
    if basic_number.zero?
      spell_zero
    else
      groups = group(basic_number)
      groups_as_words = convert_groups(groups)
      groups_as_words.flatten.join(' ')
    end.capitalize
  end

  def self.group(number)
    groups = []

    while number > 0
      number, group = number.divmod(1000)
      groups.unshift(group)
    end

    groups
  end

  def self.convert_groups(groups)
    bound = groups.count - 1
    result = []

    groups.each_with_index do |group, i|
      if group > 0
        result << convert_small_number(group)
        result << spell_rank(bound - i, group) if i < bound
      end
    end

    result
  end

  def self.convert_small_number(number)
    if number.zero?
      []
    elsif number < 20
      [spell_ones(number)]
    elsif number < 100
      tens, remainder = number.divmod(10)
      [spell_tens(tens), convert_small_number(remainder)]
    else
      hundreds, remainder = number.divmod(100)
      [spell_hundreds(hundreds), convert_small_number(remainder)]
    end
  end

  def self.validate!(number)
    max = 999_999_999
    raise ArgumentError, "#{number} is too big, only numbers up to #{max} are supported" if number > max
  end

  def self.append_cents(basic_phrase, number)
    cents = 100 * (number.to_d - number.to_i)
    spell_cents(basic_phrase, cents)
  end

  def self.backend
    @backend ||= Backend.new
  end

  def self.spell_zero;                       backend.zero;                       end
  def self.spell_ones(index);                backend.ones(index);                end
  def self.spell_tens(index);                backend.tens(index);                end
  def self.spell_hundreds(index);            backend.hundreds(index);            end
  def self.spell_rank(index, number);        backend.rank(index, number);        end
  def self.spell_cents(basic_phrase, cents); backend.cents(basic_phrase, cents); end
end
