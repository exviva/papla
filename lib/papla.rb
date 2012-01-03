# encoding: utf-8
require "papla/version"

module Papla
  def self.convert(number)
    if number.zero?
      ZERO
    else
      split(number).join(' ')
    end.capitalize
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

  def self.split(number)
    if number.zero?
      nil
    elsif number < 20
      [ONES[number]]
    elsif number < 100
      tens, remainder = number.divmod(10)
      [TENS[tens], *split(remainder)]
    else
      hundreds, remainder = number.divmod(100)
      [HUNDREDS[hundreds], *split(remainder)]
    end
  end
end
