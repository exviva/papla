require 'spec_helper'

describe Papla, 'en' do
  around do |example|
    I18n.with_locale(:en) do
      example.run
    end
  end

  it 'converts basic numbers' do
    expect(subject[0]).to eq('Zero')
    expect(subject[1]).to eq('One')
    expect(subject[2]).to eq('Two')
    expect(subject[3]).to eq('Three')
    expect(subject[4]).to eq('Four')
    expect(subject[5]).to eq('Five')
    expect(subject[6]).to eq('Six')
    expect(subject[7]).to eq('Seven')
    expect(subject[8]).to eq('Eight')
    expect(subject[9]).to eq('Nine')
    expect(subject[10]).to eq('Ten')
    expect(subject[11]).to eq('Eleven')
    expect(subject[12]).to eq('Twelve')
    expect(subject[13]).to eq('Thirteen')
    expect(subject[14]).to eq('Fourteen')
    expect(subject[15]).to eq('Fifteen')
    expect(subject[16]).to eq('Sixteen')
    expect(subject[17]).to eq('Seventeen')
    expect(subject[18]).to eq('Eighteen')
    expect(subject[19]).to eq('Nineteen')
  end

  it 'joins number of tens and ones' do
    expect(subject[20]).to eq('Twenty')
    expect(subject[21]).to eq('Twenty one')
    expect(subject[30]).to eq('Thirty')
    expect(subject[32]).to eq('Thirty two')
    expect(subject[40]).to eq('Forty')
    expect(subject[43]).to eq('Forty three')
    expect(subject[50]).to eq('Fifty')
    expect(subject[54]).to eq('Fifty four')
    expect(subject[60]).to eq('Sixty')
    expect(subject[65]).to eq('Sixty five')
    expect(subject[70]).to eq('Seventy')
    expect(subject[76]).to eq('Seventy six')
    expect(subject[80]).to eq('Eighty')
    expect(subject[87]).to eq('Eighty seven')
    expect(subject[90]).to eq('Ninety')
    expect(subject[98]).to eq('Ninety eight')
  end

  it 'joins number of hundreds, tens and ones' do
    expect(subject[100]).to eq('One hundred')
    expect(subject[101]).to eq('One hundred one')
    expect(subject[111]).to eq('One hundred eleven')
    expect(subject[122]).to eq('One hundred twenty two')

    expect(subject[200]).to eq('Two hundred')
    expect(subject[202]).to eq('Two hundred two')
    expect(subject[212]).to eq('Two hundred twelve')
    expect(subject[233]).to eq('Two hundred thirty three')

    expect(subject[300]).to eq('Three hundred')
    expect(subject[303]).to eq('Three hundred three')
    expect(subject[313]).to eq('Three hundred thirteen')
    expect(subject[344]).to eq('Three hundred forty four')

    expect(subject[400]).to eq('Four hundred')
    expect(subject[404]).to eq('Four hundred four')
    expect(subject[414]).to eq('Four hundred fourteen')
    expect(subject[455]).to eq('Four hundred fifty five')

    expect(subject[500]).to eq('Five hundred')
    expect(subject[505]).to eq('Five hundred five')
    expect(subject[515]).to eq('Five hundred fifteen')
    expect(subject[566]).to eq('Five hundred sixty six')

    expect(subject[600]).to eq('Six hundred')
    expect(subject[606]).to eq('Six hundred six')
    expect(subject[616]).to eq('Six hundred sixteen')
    expect(subject[677]).to eq('Six hundred seventy seven')

    expect(subject[700]).to eq('Seven hundred')
    expect(subject[707]).to eq('Seven hundred seven')
    expect(subject[717]).to eq('Seven hundred seventeen')
    expect(subject[788]).to eq('Seven hundred eighty eight')

    expect(subject[800]).to eq('Eight hundred')
    expect(subject[808]).to eq('Eight hundred eight')
    expect(subject[818]).to eq('Eight hundred eighteen')
    expect(subject[899]).to eq('Eight hundred ninety nine')

    expect(subject[900]).to eq('Nine hundred')
    expect(subject[909]).to eq('Nine hundred nine')
    expect(subject[919]).to eq('Nine hundred nineteen')
    expect(subject[990]).to eq('Nine hundred ninety')
  end

  it 'supports thousands' do
    expect(subject[1000]).to eq('One thousand')
    expect(subject[1001]).to eq('One thousand one')
    expect(subject[1234]).to eq('One thousand two hundred thirty four')
    expect(subject[1999]).to eq('One thousand nine hundred ninety nine')

    expect(subject[2000]).to eq('Two thousand')
    expect(subject[2001]).to eq('Two thousand one')
    expect(subject[2345]).to eq('Two thousand three hundred forty five')
    expect(subject[2888]).to eq('Two thousand eight hundred eighty eight')

    expect(subject[3000]).to eq('Three thousand')
    expect(subject[4000]).to eq('Four thousand')
    expect(subject[5000]).to eq('Five thousand')
    expect(subject[6000]).to eq('Six thousand')
    expect(subject[7000]).to eq('Seven thousand')
    expect(subject[8000]).to eq('Eight thousand')
    expect(subject[9000]).to eq('Nine thousand')
  end

  it 'supports tens of thousands' do
    expect(subject[10000]).to eq('Ten thousand')

    expect(subject[11000]).to eq('Eleven thousand')
    expect(subject[12000]).to eq('Twelve thousand')
    expect(subject[13000]).to eq('Thirteen thousand')
    expect(subject[14000]).to eq('Fourteen thousand')
    expect(subject[15000]).to eq('Fifteen thousand')
    expect(subject[16000]).to eq('Sixteen thousand')
    expect(subject[17000]).to eq('Seventeen thousand')
    expect(subject[18000]).to eq('Eighteen thousand')
    expect(subject[19000]).to eq('Nineteen thousand')
    expect(subject[20000]).to eq('Twenty thousand')

    expect(subject[21000]).to eq('Twenty one thousand')
    expect(subject[22000]).to eq('Twenty two thousand')
    expect(subject[23000]).to eq('Twenty three thousand')
    expect(subject[24000]).to eq('Twenty four thousand')
    expect(subject[25000]).to eq('Twenty five thousand')
    expect(subject[26000]).to eq('Twenty six thousand')
    expect(subject[27000]).to eq('Twenty seven thousand')
    expect(subject[28000]).to eq('Twenty eight thousand')
    expect(subject[29000]).to eq('Twenty nine thousand')

    expect(subject[33000]).to eq('Thirty three thousand')
    expect(subject[44000]).to eq('Forty four thousand')
    expect(subject[55000]).to eq('Fifty five thousand')
    expect(subject[66000]).to eq('Sixty six thousand')
    expect(subject[77000]).to eq('Seventy seven thousand')
    expect(subject[88000]).to eq('Eighty eight thousand')
    expect(subject[99000]).to eq('Ninety nine thousand')
  end

  it 'supports hundreds of thousands' do
    expect(subject[100_000]).to eq('One hundred thousand')

    expect(subject[101_000]).to eq('One hundred one thousand')
    expect(subject[102_000]).to eq('One hundred two thousand')
    expect(subject[103_000]).to eq('One hundred three thousand')
    expect(subject[104_000]).to eq('One hundred four thousand')
    expect(subject[105_000]).to eq('One hundred five thousand')
    expect(subject[111_000]).to eq('One hundred eleven thousand')
    expect(subject[112_000]).to eq('One hundred twelve thousand')
    expect(subject[113_000]).to eq('One hundred thirteen thousand')
    expect(subject[222_000]).to eq('Two hundred twenty two thousand')
    expect(subject[333_000]).to eq('Three hundred thirty three thousand')
    expect(subject[444_000]).to eq('Four hundred forty four thousand')
    expect(subject[555_000]).to eq('Five hundred fifty five thousand')
    expect(subject[666_000]).to eq('Six hundred sixty six thousand')
    expect(subject[777_000]).to eq('Seven hundred seventy seven thousand')
    expect(subject[999_000]).to eq('Nine hundred ninety nine thousand')
    expect(subject[999_999]).to eq('Nine hundred ninety nine thousand nine hundred ninety nine')
  end

  it 'supports millions' do
    expect(subject[1_000_000]).to eq('One million')
    expect(subject[1_000_001]).to eq('One million one')
    expect(subject[1_001_001]).to eq('One million one thousand one')
    expect(subject[1_234_567]).to eq('One million two hundred thirty four thousand five hundred sixty seven')
    expect(subject[2_000_000]).to eq('Two million')
    expect(subject[3_303_303]).to eq('Three million three hundred three thousand three hundred three')
    expect(subject[4_004_000]).to eq('Four million four thousand')
    expect(subject[5_500_000]).to eq('Five million five hundred thousand')
    expect(subject[6_000_000]).to eq('Six million')
    expect(subject[7_000_000]).to eq('Seven million')
    expect(subject[9_000_000]).to eq('Nine million')
  end

  it 'supports tens of millions' do
    expect(subject[11_000_000]).to eq('Eleven million')
    expect(subject[13_000_000]).to eq('Thirteen million')
    expect(subject[15_000_000]).to eq('Fifteen million')
    expect(subject[19_000_000]).to eq('Nineteen million')
    expect(subject[20_000_000]).to eq('Twenty million')
    expect(subject[22_000_000]).to eq('Twenty two million')
    expect(subject[33_000_000]).to eq('Thirty three million')
    expect(subject[44_000_000]).to eq('Forty four million')
    expect(subject[55_000_000]).to eq('Fifty five million')
    expect(subject[66_000_000]).to eq('Sixty six million')
    expect(subject[77_000_000]).to eq('Seventy seven million')
    expect(subject[88_000_000]).to eq('Eighty eight million')
    expect(subject[99_000_000]).to eq('Ninety nine million')
    expect(subject[99_999_999]).to eq('Ninety nine million nine hundred ninety nine thousand nine hundred ninety nine')
  end

  it 'supports hundreds of millions' do
    expect(subject[100_000_000]).to eq('One hundred million')
    expect(subject[100_000_001]).to eq('One hundred million one')
    expect(subject[102_100_000]).to eq('One hundred two million one hundred thousand')
    expect(subject[222_000_000]).to eq('Two hundred twenty two million')
    expect(subject[333_000_000]).to eq('Three hundred thirty three million')
    expect(subject[400_000_000]).to eq('Four hundred million')
    expect(subject[500_000_000]).to eq('Five hundred million')
    expect(subject[600_000_000]).to eq('Six hundred million')
    expect(subject[700_000_000]).to eq('Seven hundred million')
    expect(subject[880_000_000]).to eq('Eight hundred eighty million')
    expect(subject[999_999_999]).to eq('Nine hundred ninety nine million nine hundred ninety nine thousand nine hundred ninety nine')
  end

  it 'does not support billions' do
    expect { subject[1_000_000_000] }.to raise_error(ArgumentError)
  end

  describe 'floats' do
    it 'appends the decimal part as cents' do
      expect(subject[1.23]).to eq('One 23/100')
    end

    it 'displays two decimal digits' do
      expect(subject[2.0]).to eq('Two 00/100')
    end

    it 'rounds to two decimal places' do
      expect(subject[3.456]).to eq('Three 46/100')
    end

    it 'properly handles float precision imperfections' do
      expect(subject[111_111.2]).to eq('One hundred eleven thousand one hundred eleven 20/100')
    end
  end

  describe 'money' do
    it 'concatenates dollars, cents and currency' do
      discounted_price = Money.new(9999, 'PLN')
      expect(Papla[discounted_price]).to eq('Ninety nine 99/100 PLN')
    end
  end
end
