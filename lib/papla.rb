require 'papla/backend'

module Papla
  autoload :FixnumConverter, 'papla/fixnum_converter'
  autoload :FloatConverter, 'papla/float_converter'
  autoload :MoneyConverter, 'papla/money_converter'

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
  # If you're using the `money` gem, you can pass in an instance
  # of `Money` to Papla. The returned string will contain the dollars
  # part as words, the cents part as 'xx/100' and the currency
  # string (e.g. `EUR`).
  #
  # Example:
  #
  #   eleven_and_a_half_pounds = Money.new(1150, 'GBP')
  #   Papla[eleven_and_a_half_pounds] # => "Jedenaście 50/100 GBP"
  #
  #   I18n.locale = :en
  #   discounted_price = Money.new(9999, 'PLN')
  #   Papla[discounted_price] # => "Ninety nine 99/100 PLN"
  #
  # @param [Fixnum] number the number to convert
  # @return [String] the phrase in Polish or English
  def self.[](number)
    converter = converter_for(number)
    converter.new.convert(number)
  end

  private

  def self.converter_for(number)
    case number
    when defined?(Money) && Money then MoneyConverter
    when Float then FloatConverter
    when Fixnum then FixnumConverter
    else raise ArgumentError, "Unsupported type: #{klass}"
    end
  end
end
