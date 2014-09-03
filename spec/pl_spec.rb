require 'spec_helper'

describe Papla, 'pl' do
  around do |example|
    I18n.with_locale(:pl) do
      example.run
    end
  end

  it 'converts basic numbers' do
    expect(subject[0]).to eq('Zero')
    expect(subject[1]).to eq('Jeden')
    expect(subject[2]).to eq('Dwa')
    expect(subject[3]).to eq('Trzy')
    expect(subject[4]).to eq('Cztery')
    expect(subject[5]).to eq('Pięć')
    expect(subject[6]).to eq('Sześć')
    expect(subject[7]).to eq('Siedem')
    expect(subject[8]).to eq('Osiem')
    expect(subject[9]).to eq('Dziewięć')
    expect(subject[10]).to eq('Dziesięć')
    expect(subject[11]).to eq('Jedenaście')
    expect(subject[12]).to eq('Dwanaście')
    expect(subject[13]).to eq('Trzynaście')
    expect(subject[14]).to eq('Czternaście')
    expect(subject[15]).to eq('Piętnaście')
    expect(subject[16]).to eq('Szesnaście')
    expect(subject[17]).to eq('Siedemnaście')
    expect(subject[18]).to eq('Osiemnaście')
    expect(subject[19]).to eq('Dziewiętnaście')
  end

  it 'joins number of tens and ones' do
    expect(subject[20]).to eq('Dwadzieścia')
    expect(subject[21]).to eq('Dwadzieścia jeden')
    expect(subject[30]).to eq('Trzydzieści')
    expect(subject[32]).to eq('Trzydzieści dwa')
    expect(subject[40]).to eq('Czterdzieści')
    expect(subject[43]).to eq('Czterdzieści trzy')
    expect(subject[50]).to eq('Pięćdziesiąt')
    expect(subject[54]).to eq('Pięćdziesiąt cztery')
    expect(subject[60]).to eq('Sześćdziesiąt')
    expect(subject[65]).to eq('Sześćdziesiąt pięć')
    expect(subject[70]).to eq('Siedemdziesiąt')
    expect(subject[76]).to eq('Siedemdziesiąt sześć')
    expect(subject[80]).to eq('Osiemdziesiąt')
    expect(subject[87]).to eq('Osiemdziesiąt siedem')
    expect(subject[90]).to eq('Dziewięćdziesiąt')
    expect(subject[98]).to eq('Dziewięćdziesiąt osiem')
  end

  it 'joins number of hundreds, tens and ones' do
    expect(subject[100]).to eq('Sto')
    expect(subject[101]).to eq('Sto jeden')
    expect(subject[111]).to eq('Sto jedenaście')
    expect(subject[122]).to eq('Sto dwadzieścia dwa')

    expect(subject[200]).to eq('Dwieście')
    expect(subject[202]).to eq('Dwieście dwa')
    expect(subject[212]).to eq('Dwieście dwanaście')
    expect(subject[233]).to eq('Dwieście trzydzieści trzy')

    expect(subject[300]).to eq('Trzysta')
    expect(subject[303]).to eq('Trzysta trzy')
    expect(subject[313]).to eq('Trzysta trzynaście')
    expect(subject[344]).to eq('Trzysta czterdzieści cztery')

    expect(subject[400]).to eq('Czterysta')
    expect(subject[404]).to eq('Czterysta cztery')
    expect(subject[414]).to eq('Czterysta czternaście')
    expect(subject[455]).to eq('Czterysta pięćdziesiąt pięć')

    expect(subject[500]).to eq('Pięćset')
    expect(subject[505]).to eq('Pięćset pięć')
    expect(subject[515]).to eq('Pięćset piętnaście')
    expect(subject[566]).to eq('Pięćset sześćdziesiąt sześć')

    expect(subject[600]).to eq('Sześćset')
    expect(subject[606]).to eq('Sześćset sześć')
    expect(subject[616]).to eq('Sześćset szesnaście')
    expect(subject[677]).to eq('Sześćset siedemdziesiąt siedem')

    expect(subject[700]).to eq('Siedemset')
    expect(subject[707]).to eq('Siedemset siedem')
    expect(subject[717]).to eq('Siedemset siedemnaście')
    expect(subject[788]).to eq('Siedemset osiemdziesiąt osiem')

    expect(subject[800]).to eq('Osiemset')
    expect(subject[808]).to eq('Osiemset osiem')
    expect(subject[818]).to eq('Osiemset osiemnaście')
    expect(subject[899]).to eq('Osiemset dziewięćdziesiąt dziewięć')

    expect(subject[900]).to eq('Dziewięćset')
    expect(subject[909]).to eq('Dziewięćset dziewięć')
    expect(subject[919]).to eq('Dziewięćset dziewiętnaście')
    expect(subject[990]).to eq('Dziewięćset dziewięćdziesiąt')
  end

  it 'supports thousands' do
    expect(subject[1000]).to eq('Jeden tysiąc')
    expect(subject[1001]).to eq('Jeden tysiąc jeden')
    expect(subject[1234]).to eq('Jeden tysiąc dwieście trzydzieści cztery')
    expect(subject[1999]).to eq('Jeden tysiąc dziewięćset dziewięćdziesiąt dziewięć')

    expect(subject[2000]).to eq('Dwa tysiące')
    expect(subject[2001]).to eq('Dwa tysiące jeden')
    expect(subject[2345]).to eq('Dwa tysiące trzysta czterdzieści pięć')
    expect(subject[2888]).to eq('Dwa tysiące osiemset osiemdziesiąt osiem')

    expect(subject[3000]).to eq('Trzy tysiące')
    expect(subject[4000]).to eq('Cztery tysiące')
    expect(subject[5000]).to eq('Pięć tysięcy')
    expect(subject[6000]).to eq('Sześć tysięcy')
    expect(subject[7000]).to eq('Siedem tysięcy')
    expect(subject[8000]).to eq('Osiem tysięcy')
    expect(subject[9000]).to eq('Dziewięć tysięcy')
  end

  it 'supports tens of thousands' do
    expect(subject[10000]).to eq('Dziesięć tysięcy')

    expect(subject[11000]).to eq('Jedenaście tysięcy')
    expect(subject[12000]).to eq('Dwanaście tysięcy')
    expect(subject[13000]).to eq('Trzynaście tysięcy')
    expect(subject[14000]).to eq('Czternaście tysięcy')
    expect(subject[15000]).to eq('Piętnaście tysięcy')
    expect(subject[16000]).to eq('Szesnaście tysięcy')
    expect(subject[17000]).to eq('Siedemnaście tysięcy')
    expect(subject[18000]).to eq('Osiemnaście tysięcy')
    expect(subject[19000]).to eq('Dziewiętnaście tysięcy')
    expect(subject[20000]).to eq('Dwadzieścia tysięcy')

    expect(subject[21000]).to eq('Dwadzieścia jeden tysięcy')
    expect(subject[22000]).to eq('Dwadzieścia dwa tysiące')
    expect(subject[23000]).to eq('Dwadzieścia trzy tysiące')
    expect(subject[24000]).to eq('Dwadzieścia cztery tysiące')
    expect(subject[25000]).to eq('Dwadzieścia pięć tysięcy')
    expect(subject[26000]).to eq('Dwadzieścia sześć tysięcy')
    expect(subject[27000]).to eq('Dwadzieścia siedem tysięcy')
    expect(subject[28000]).to eq('Dwadzieścia osiem tysięcy')
    expect(subject[29000]).to eq('Dwadzieścia dziewięć tysięcy')

    expect(subject[33000]).to eq('Trzydzieści trzy tysiące')
    expect(subject[44000]).to eq('Czterdzieści cztery tysiące')
    expect(subject[55000]).to eq('Pięćdziesiąt pięć tysięcy')
    expect(subject[66000]).to eq('Sześćdziesiąt sześć tysięcy')
    expect(subject[77000]).to eq('Siedemdziesiąt siedem tysięcy')
    expect(subject[88000]).to eq('Osiemdziesiąt osiem tysięcy')
    expect(subject[99000]).to eq('Dziewięćdziesiąt dziewięć tysięcy')
  end

  it 'supports hundreds of thousands' do
    expect(subject[100_000]).to eq('Sto tysięcy')

    expect(subject[101_000]).to eq('Sto jeden tysięcy')
    expect(subject[102_000]).to eq('Sto dwa tysiące')
    expect(subject[103_000]).to eq('Sto trzy tysiące')
    expect(subject[104_000]).to eq('Sto cztery tysiące')
    expect(subject[105_000]).to eq('Sto pięć tysięcy')
    expect(subject[111_000]).to eq('Sto jedenaście tysięcy')
    expect(subject[112_000]).to eq('Sto dwanaście tysięcy')
    expect(subject[113_000]).to eq('Sto trzynaście tysięcy')
    expect(subject[222_000]).to eq('Dwieście dwadzieścia dwa tysiące')
    expect(subject[333_000]).to eq('Trzysta trzydzieści trzy tysiące')
    expect(subject[444_000]).to eq('Czterysta czterdzieści cztery tysiące')
    expect(subject[555_000]).to eq('Pięćset pięćdziesiąt pięć tysięcy')
    expect(subject[666_000]).to eq('Sześćset sześćdziesiąt sześć tysięcy')
    expect(subject[777_000]).to eq('Siedemset siedemdziesiąt siedem tysięcy')
    expect(subject[999_000]).to eq('Dziewięćset dziewięćdziesiąt dziewięć tysięcy')
    expect(subject[999_999]).to eq('Dziewięćset dziewięćdziesiąt dziewięć tysięcy dziewięćset dziewięćdziesiąt dziewięć')
  end

  it 'supports millions' do
    expect(subject[1_000_000]).to eq('Jeden milion')
    expect(subject[1_000_001]).to eq('Jeden milion jeden')
    expect(subject[1_001_001]).to eq('Jeden milion jeden tysiąc jeden')
    expect(subject[1_234_567]).to eq('Jeden milion dwieście trzydzieści cztery tysiące pięćset sześćdziesiąt siedem')
    expect(subject[2_000_000]).to eq('Dwa miliony')
    expect(subject[3_303_303]).to eq('Trzy miliony trzysta trzy tysiące trzysta trzy')
    expect(subject[4_004_000]).to eq('Cztery miliony cztery tysiące')
    expect(subject[5_500_000]).to eq('Pięć milionów pięćset tysięcy')
    expect(subject[6_000_000]).to eq('Sześć milionów')
    expect(subject[7_000_000]).to eq('Siedem milionów')
    expect(subject[9_000_000]).to eq('Dziewięć milionów')
  end

  it 'supports tens of millions' do
    expect(subject[11_000_000]).to eq('Jedenaście milionów')
    expect(subject[13_000_000]).to eq('Trzynaście milionów')
    expect(subject[15_000_000]).to eq('Piętnaście milionów')
    expect(subject[19_000_000]).to eq('Dziewiętnaście milionów')
    expect(subject[20_000_000]).to eq('Dwadzieścia milionów')
    expect(subject[22_000_000]).to eq('Dwadzieścia dwa miliony')
    expect(subject[33_000_000]).to eq('Trzydzieści trzy miliony')
    expect(subject[44_000_000]).to eq('Czterdzieści cztery miliony')
    expect(subject[55_000_000]).to eq('Pięćdziesiąt pięć milionów')
    expect(subject[66_000_000]).to eq('Sześćdziesiąt sześć milionów')
    expect(subject[77_000_000]).to eq('Siedemdziesiąt siedem milionów')
    expect(subject[88_000_000]).to eq('Osiemdziesiąt osiem milionów')
    expect(subject[99_000_000]).to eq('Dziewięćdziesiąt dziewięć milionów')
    expect(subject[99_999_999]).to eq('Dziewięćdziesiąt dziewięć milionów dziewięćset dziewięćdziesiąt dziewięć tysięcy dziewięćset dziewięćdziesiąt dziewięć')
  end

  it 'supports hundreds of millions' do
    expect(subject[100_000_000]).to eq('Sto milionów')
    expect(subject[100_000_001]).to eq('Sto milionów jeden')
    expect(subject[102_100_000]).to eq('Sto dwa miliony sto tysięcy')
    expect(subject[222_000_000]).to eq('Dwieście dwadzieścia dwa miliony')
    expect(subject[333_000_000]).to eq('Trzysta trzydzieści trzy miliony')
    expect(subject[400_000_000]).to eq('Czterysta milionów')
    expect(subject[500_000_000]).to eq('Pięćset milionów')
    expect(subject[600_000_000]).to eq('Sześćset milionów')
    expect(subject[700_000_000]).to eq('Siedemset milionów')
    expect(subject[880_000_000]).to eq('Osiemset osiemdziesiąt milionów')
    expect(subject[999_999_999]).to eq('Dziewięćset dziewięćdziesiąt dziewięć milionów dziewięćset dziewięćdziesiąt dziewięć tysięcy dziewięćset dziewięćdziesiąt dziewięć')
  end

  it 'does not support billions' do
    expect { subject[1_000_000_000] }.to raise_error(ArgumentError)
  end

  describe 'floats' do
    it 'appends the decimal part as cents' do
      expect(subject[1.23]).to eq('Jeden 23/100')
    end

    it 'displays two decimal digits' do
      expect(subject[2.0]).to eq('Dwa 00/100')
    end

    it 'rounds to two decimal places' do
      expect(subject[3.456]).to eq('Trzy 46/100')
    end

    it 'properly handles float precision imperfections' do
      expect(subject[111_111.2]).to eq('Sto jedenaście tysięcy sto jedenaście 20/100')
    end
  end

  describe 'money' do
    it 'concatenates dollars, cents and currency' do
      eleven_and_a_half_pounds = Money.new(1150, 'GBP')
      expect(Papla[eleven_and_a_half_pounds]).to eq('Jedenaście 50/100 GBP')
    end
  end
end
