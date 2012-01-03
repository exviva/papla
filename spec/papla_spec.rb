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

  it 'supports thousands' do
    subject[1000].should eq('Jeden tysiąc')
    subject[1001].should eq('Jeden tysiąc jeden')
    subject[1234].should eq('Jeden tysiąc dwieście trzydzieści cztery')
    subject[1999].should eq('Jeden tysiąc dziewięćset dziewięćdziesiąt dziewięć')

    subject[2000].should eq('Dwa tysiące')
    subject[2001].should eq('Dwa tysiące jeden')
    subject[2345].should eq('Dwa tysiące trzysta czterdzieści pięć')
    subject[2888].should eq('Dwa tysiące osiemset osiemdziesiąt osiem')

    subject[3000].should eq('Trzy tysiące')
    subject[4000].should eq('Cztery tysiące')
    subject[5000].should eq('Pięć tysięcy')
    subject[6000].should eq('Sześć tysięcy')
    subject[7000].should eq('Siedem tysięcy')
    subject[8000].should eq('Osiem tysięcy')
    subject[9000].should eq('Dziewięć tysięcy')
  end

  it 'supports tens of thousands' do
    subject[10000].should eq('Dziesięć tysięcy')

    subject[11000].should eq('Jedenaście tysięcy')
    subject[12000].should eq('Dwanaście tysięcy')
    subject[13000].should eq('Trzynaście tysięcy')
    subject[14000].should eq('Czternaście tysięcy')
    subject[15000].should eq('Piętnaście tysięcy')
    subject[16000].should eq('Szesnaście tysięcy')
    subject[17000].should eq('Siedemnaście tysięcy')
    subject[18000].should eq('Osiemnaście tysięcy')
    subject[19000].should eq('Dziewiętnaście tysięcy')
    subject[20000].should eq('Dwadzieścia tysięcy')

    subject[21000].should eq('Dwadzieścia jeden tysięcy')
    subject[22000].should eq('Dwadzieścia dwa tysiące')
    subject[23000].should eq('Dwadzieścia trzy tysiące')
    subject[24000].should eq('Dwadzieścia cztery tysiące')
    subject[25000].should eq('Dwadzieścia pięć tysięcy')
    subject[26000].should eq('Dwadzieścia sześć tysięcy')
    subject[27000].should eq('Dwadzieścia siedem tysięcy')
    subject[28000].should eq('Dwadzieścia osiem tysięcy')
    subject[29000].should eq('Dwadzieścia dziewięć tysięcy')

    subject[33000].should eq('Trzydzieści trzy tysiące')
    subject[44000].should eq('Czterdzieści cztery tysiące')
    subject[55000].should eq('Pięćdziesiąt pięć tysięcy')
    subject[66000].should eq('Sześćdziesiąt sześć tysięcy')
    subject[77000].should eq('Siedemdziesiąt siedem tysięcy')
    subject[88000].should eq('Osiemdziesiąt osiem tysięcy')
    subject[99000].should eq('Dziewięćdziesiąt dziewięć tysięcy')
  end

  it 'supports hundreds of thousands' do
    subject[100_000].should eq('Sto tysięcy')

    subject[101_000].should eq('Sto jeden tysięcy')
    subject[102_000].should eq('Sto dwa tysiące')
    subject[103_000].should eq('Sto trzy tysiące')
    subject[104_000].should eq('Sto cztery tysiące')
    subject[105_000].should eq('Sto pięć tysięcy')
    subject[111_000].should eq('Sto jedenaście tysięcy')
    subject[112_000].should eq('Sto dwanaście tysięcy')
    subject[113_000].should eq('Sto trzynaście tysięcy')
    subject[222_000].should eq('Dwieście dwadzieścia dwa tysiące')
    subject[333_000].should eq('Trzysta trzydzieści trzy tysiące')
    subject[444_000].should eq('Czterysta czterdzieści cztery tysiące')
    subject[555_000].should eq('Pięćset pięćdziesiąt pięć tysięcy')
    subject[666_000].should eq('Sześćset sześćdziesiąt sześć tysięcy')
    subject[777_000].should eq('Siedemset siedemdziesiąt siedem tysięcy')
    subject[999_000].should eq('Dziewięćset dziewięćdziesiąt dziewięć tysięcy')
    subject[999_999].should eq('Dziewięćset dziewięćdziesiąt dziewięć tysięcy dziewięćset dziewięćdziesiąt dziewięć')
  end

  it 'supports millions' do
    subject[1_000_000].should eq('Jeden milion')
    subject[1_000_001].should eq('Jeden milion jeden')
    subject[1_001_001].should eq('Jeden milion jeden tysiąc jeden')
    subject[1_234_567].should eq('Jeden milion dwieście trzydzieści cztery tysiące pięćset sześćdziesiąt siedem')
    subject[2_000_000].should eq('Dwa miliony')
    subject[3_303_303].should eq('Trzy miliony trzysta trzy tysiące trzysta trzy')
    subject[4_004_000].should eq('Cztery miliony cztery tysiące')
    subject[5_500_000].should eq('Pięć milionów pięćset tysięcy')
    subject[6_000_000].should eq('Sześć milionów')
    subject[7_000_000].should eq('Siedem milionów')
    subject[9_000_000].should eq('Dziewięć milionów')
  end

  it 'supports tens of millions' do
    subject[11_000_000].should eq('Jedenaście milionów')
    subject[13_000_000].should eq('Trzynaście milionów')
    subject[15_000_000].should eq('Piętnaście milionów')
    subject[19_000_000].should eq('Dziewiętnaście milionów')
    subject[20_000_000].should eq('Dwadzieścia milionów')
    subject[22_000_000].should eq('Dwadzieścia dwa miliony')
    subject[33_000_000].should eq('Trzydzieści trzy miliony')
    subject[44_000_000].should eq('Czterdzieści cztery miliony')
    subject[55_000_000].should eq('Pięćdziesiąt pięć milionów')
    subject[66_000_000].should eq('Sześćdziesiąt sześć milionów')
    subject[77_000_000].should eq('Siedemdziesiąt siedem milionów')
    subject[88_000_000].should eq('Osiemdziesiąt osiem milionów')
    subject[99_000_000].should eq('Dziewięćdziesiąt dziewięć milionów')
    subject[99_999_999].should eq('Dziewięćdziesiąt dziewięć milionów dziewięćset dziewięćdziesiąt dziewięć tysięcy dziewięćset dziewięćdziesiąt dziewięć')
  end

  it 'supports hundreds of millions' do
    subject[100_000_000].should eq('Sto milionów')
    subject[100_000_001].should eq('Sto milionów jeden')
    subject[102_100_000].should eq('Sto dwa miliony sto tysięcy')
    subject[222_000_000].should eq('Dwieście dwadzieścia dwa miliony')
    subject[333_000_000].should eq('Trzysta trzydzieści trzy miliony')
    subject[400_000_000].should eq('Czterysta milionów')
    subject[500_000_000].should eq('Pięćset milionów')
    subject[600_000_000].should eq('Sześćset milionów')
    subject[700_000_000].should eq('Siedemset milionów')
    subject[880_000_000].should eq('Osiemset osiemdziesiąt milionów')
    subject[999_999_999].should eq('Dziewięćset dziewięćdziesiąt dziewięć milionów dziewięćset dziewięćdziesiąt dziewięć tysięcy dziewięćset dziewięćdziesiąt dziewięć')
  end

  it 'does not support billions' do
    proc { subject[1_000_000_000] }.should raise_error(ArgumentError)
  end
end
