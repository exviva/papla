# encoding: utf-8
require "papla/version"

module Papla
  # Converts a number to Polish words, capitalizing
  # the first letter of the whole phrase.
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
  # @return [String] the phrase in Polish
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
  ZERO = 'zero'

  ONES = [nil] + %w[
    jeden dwa trzy cztery pięć
    sześć siedem osiem dziewięć dziesięć
    jedenaście dwanaście trzynaście czternaście piętnaście
    szesnaście siedemnaście osiemnaście dziewiętnaście
  ].freeze

  TENS = [nil, nil] + %w[
    dwadzieścia trzydzieści czterdzieści pięćdziesiąt
    sześćdziesiąt siedemdziesiąt osiemdziesiąt dziewięćdziesiąt
  ].freeze

  HUNDREDS = [nil] + %w[
    sto dwieście trzysta czterysta pięćset
    sześćset siedemset osiemset dziewięćset
  ].freeze

  RANKS = [
    [],
    ['tysięcy', 'tysiąc', 'tysiące'].freeze,
    ['milionów', 'milion', 'miliony'].freeze,
    ['miliardów', 'miliard', 'miliardy'].freeze
  ].freeze

  def self.prepare(number)
    case number
    when Float; number.round(2)
    else number
    end
  end

  def self.build_basic_phrase(basic_number)
    if basic_number.zero?
      ZERO
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
        result << rank(bound - i, group) if i < bound
      end
    end

    result
  end

  def self.convert_small_number(number)
    if number.zero?
      []
    elsif number < 20
      [ONES[number]]
    elsif number < 100
      tens, remainder = number.divmod(10)
      [TENS[tens], convert_small_number(remainder)]
    else
      hundreds, remainder = number.divmod(100)
      [HUNDREDS[hundreds], convert_small_number(remainder)]
    end
  end

  def self.rank(rank, number)
    RANKS[rank][declination_index(number)]
  end

  def self.declination_index(number)
    return 1 if number == 1

    remainder = number - number / 100 * 100

    case remainder
    when 12..14 then 0
    else
      ones = number - number / 10 * 10

      case ones
      when 2..4 then 2
      else 0
      end
    end
  end

  def self.validate!(number)
    max = 999_999_999
    raise ArgumentError, "#{number} is too big, only numbers up to #{max} are supported" if number > max
  end

  def self.append_cents(basic_phrase, number)
    cents = 100 * (number - number.to_i)
    "%s %02d/100" % [basic_phrase, cents]
  end
end
