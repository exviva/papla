# encoding: utf-8
require 'spec_helper'

describe Papla do
  subject { proc {|number| described_class.convert(number)} }

  it 'converts basic numbers' do
    subject[0].should eq('Zero')
    subject[1].should eq('Jeden')
    subject[2].should eq('Dwa')
    subject[3].should eq('Trzy')
    subject[4].should eq('Cztery')
    subject[5].should eq('Pięć')
    subject[6].should eq('Sześć')
    subject[7].should eq('Siedem')
    subject[8].should eq('Osiem')
    subject[9].should eq('Dziewięć')
    subject[10].should eq('Dziesięć')
    subject[11].should eq('Jedenaście')
    subject[12].should eq('Dwanaście')
    subject[13].should eq('Trzynaście')
    subject[14].should eq('Czternaście')
    subject[15].should eq('Piętnaście')
    subject[16].should eq('Szesnaście')
    subject[17].should eq('Siedemnaście')
    subject[18].should eq('Osiemnaście')
    subject[19].should eq('Dziewiętnaście')
  end

  it 'joins number of tens and ones' do
    subject[20].should eq('Dwadzieścia')
    subject[21].should eq('Dwadzieścia jeden')
    subject[30].should eq('Trzydzieści')
    subject[32].should eq('Trzydzieści dwa')
    subject[40].should eq('Czterdzieści')
    subject[43].should eq('Czterdzieści trzy')
    subject[50].should eq('Pięćdziesiąt')
    subject[54].should eq('Pięćdziesiąt cztery')
    subject[60].should eq('Sześćdziesiąt')
    subject[65].should eq('Sześćdziesiąt pięć')
    subject[70].should eq('Siedemdziesiąt')
    subject[76].should eq('Siedemdziesiąt sześć')
    subject[80].should eq('Osiemdziesiąt')
    subject[87].should eq('Osiemdziesiąt siedem')
    subject[90].should eq('Dziewięćdziesiąt')
    subject[98].should eq('Dziewięćdziesiąt osiem')
  end
end
