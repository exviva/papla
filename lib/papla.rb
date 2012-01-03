# encoding: utf-8
require "papla/version"

module Papla
  def self.convert(number)
    if number < 20
      ONES[number]
    else
      tens = number / 10
      ones = number - tens * 10
      [TENS[tens], ones.zero? ? nil : ONES[ones]].compact.join(' ')
    end.capitalize
  end

  private
  ONES = %w[
    zero jeden dwa trzy cztery pięć
    sześć siedem osiem dziewięć dziesięć
    jedenaście dwanaście trzynaście czternaście piętnaście
    szesnaście siedemnaście osiemnaście dziewiętnaście
  ].freeze

  TENS = %w[
    nil nil dwadzieścia trzydzieści czterdzieści pięćdziesiąt
    sześćdziesiąt siedemdziesiąt osiemdziesiąt dziewięćdziesiąt
  ]
end
