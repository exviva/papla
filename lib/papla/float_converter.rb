require 'bigdecimal'
require 'bigdecimal/util'

module Papla
  class FloatConverter < IntegerConverter
    def convert(number)
      number = number.round(2)
      append_cents(super(number.to_i), number)
    end

    private

    def append_cents(basic_phrase, number)
      cents = 100 * (number.to_d - number.to_i)
      cents = cents.round(2)
      spell_cents(basic_phrase, cents)
    end

    def spell_cents(basic_phrase, cents); backend.cents(basic_phrase, cents); end
  end
end
