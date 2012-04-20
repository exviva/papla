module Papla
  class MoneyConverter < FloatConverter
    def convert(number)
      append_currency(super(number.to_f.round(2)), number)
    end

    private

    def append_currency(phrase, money)
      '%s %s' % [phrase, money.currency_as_string]
    end
  end
end
