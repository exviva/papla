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

  it 'joins number of hundreds, tens and ones' do
    subject[100].should eq('Sto')
    subject[101].should eq('Sto jeden')
    subject[111].should eq('Sto jedenaście')
    subject[122].should eq('Sto dwadzieścia dwa')

    subject[200].should eq('Dwieście')
    subject[202].should eq('Dwieście dwa')
    subject[212].should eq('Dwieście dwanaście')
    subject[233].should eq('Dwieście trzydzieści trzy')

    subject[300].should eq('Trzysta')
    subject[303].should eq('Trzysta trzy')
    subject[313].should eq('Trzysta trzynaście')
    subject[344].should eq('Trzysta czterdzieści cztery')

    subject[400].should eq('Czterysta')
    subject[404].should eq('Czterysta cztery')
    subject[414].should eq('Czterysta czternaście')
    subject[455].should eq('Czterysta pięćdziesiąt pięć')

    subject[500].should eq('Pięćset')
    subject[505].should eq('Pięćset pięć')
    subject[515].should eq('Pięćset piętnaście')
    subject[566].should eq('Pięćset sześćdziesiąt sześć')

    subject[600].should eq('Sześćset')
    subject[606].should eq('Sześćset sześć')
    subject[616].should eq('Sześćset szesnaście')
    subject[677].should eq('Sześćset siedemdziesiąt siedem')

    subject[700].should eq('Siedemset')
    subject[707].should eq('Siedemset siedem')
    subject[717].should eq('Siedemset siedemnaście')
    subject[788].should eq('Siedemset osiemdziesiąt osiem')

    subject[800].should eq('Osiemset')
    subject[808].should eq('Osiemset osiem')
    subject[818].should eq('Osiemset osiemnaście')
    subject[899].should eq('Osiemset dziewięćdziesiąt dziewięć')

    subject[900].should eq('Dziewięćset')
    subject[909].should eq('Dziewięćset dziewięć')
    subject[919].should eq('Dziewięćset dziewiętnaście')
    subject[990].should eq('Dziewięćset dziewięćdziesiąt')
  end
end
