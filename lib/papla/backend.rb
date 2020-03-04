require 'i18n'

I18n.load_path += Dir[File.expand_path('../locale/*', __FILE__)]

module Papla
  class Backend
    def zero
      translate(:zero)
    end

    def ones(index)
      translate(:ones)[index]
    end

    def tens(index)
      translate(:tens)[index]
    end

    def hundreds(index)
      translate(:hundreds)[index]
    end

    def rank(index, number)
      rule = pluralization_rule(number)
      rules = translate(:ranks)[index]
      rules[rule] || rules[rule.to_s]
    end

    def cents(basic_phrase, cents)
      cents = "%02d" % cents
      translate(:cents, basic_phrase: basic_phrase, cents: cents)
    end

    private

    def translate(message, options = {})
      options[:scope] = :papla
      I18n.translate(message, **options)
    end

    def pluralization_rule(number)
      I18n.translate(:papla)[:pluralization][number]
    end
  end
end
