require 'i18n'

I18n.load_path << File.expand_path('../locale/pl.yml', __FILE__)
I18n.load_path << File.expand_path('../locale/pl.rb', __FILE__)

module Papla
  class Backend
    def initialize(locale)
      @locale = locale
    end

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
      rules[rule.to_s]
    end

    def cents(basic_phrase, cents)
      cents = "%02d" % cents
      translate(:cents, basic_phrase: basic_phrase, cents: cents)
    end

    private

    def translate(message, options = {})
      options[:locale] = @locale
      options[:scope] = :papla
      I18n.translate(message, options)
    end

    def pluralization_rule(number)
      I18n.translate(:papla, locale: @locale)[:pluralization][number]
    end
  end
end
