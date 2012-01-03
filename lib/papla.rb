# encoding: utf-8
require "papla/version"

module Papla
  def self.convert(number)
    WORDS[number].capitalize
  end

  private
  WORDS = %w[
    zero jeden dwa trzy cztery pięć
    sześć siedem osiem dziewięć dziesięć
    jedenaście dwanaście trzynaście czternaście piętnaście
    szesnaście siedemnaście osiemnaście dziewiętnaście dwadzieścia
  ].freeze
end
