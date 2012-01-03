# encoding: utf-8
require 'spec_helper'

describe Papla do
  def convert(number)
    described_class.convert(number)
  end

  it 'converts basic numbers' do
    convert(0).should eq('Zero')
    convert(1).should eq('Jeden')
    convert(2).should eq('Dwa')
    convert(3).should eq('Trzy')
    convert(4).should eq('Cztery')
    convert(5).should eq('Pięć')
    convert(6).should eq('Sześć')
    convert(7).should eq('Siedem')
    convert(8).should eq('Osiem')
    convert(9).should eq('Dziewięć')
    convert(10).should eq('Dziesięć')
    convert(11).should eq('Jedenaście')
    convert(12).should eq('Dwanaście')
    convert(13).should eq('Trzynaście')
    convert(14).should eq('Czternaście')
    convert(15).should eq('Piętnaście')
    convert(16).should eq('Szesnaście')
    convert(17).should eq('Siedemnaście')
    convert(18).should eq('Osiemnaście')
    convert(19).should eq('Dziewiętnaście')
    convert(20).should eq('Dwadzieścia')
  end
end
