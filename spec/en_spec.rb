require 'spec_helper'

describe Papla, 'en' do
  around do |example|
    I18n.with_locale(:en) do
      example.run
    end
  end

  it 'converts basic numbers' do
    subject[0].should eq('Zero')
    subject[1].should eq('One')
    subject[2].should eq('Two')
    subject[3].should eq('Three')
    subject[4].should eq('Four')
    subject[5].should eq('Five')
    subject[6].should eq('Six')
    subject[7].should eq('Seven')
    subject[8].should eq('Eight')
    subject[9].should eq('Nine')
    subject[10].should eq('Ten')
    subject[11].should eq('Eleven')
    subject[12].should eq('Twelve')
    subject[13].should eq('Thirteen')
    subject[14].should eq('Fourteen')
    subject[15].should eq('Fifteen')
    subject[16].should eq('Sixteen')
    subject[17].should eq('Seventeen')
    subject[18].should eq('Eighteen')
    subject[19].should eq('Nineteen')
  end

  it 'joins number of tens and ones' do
    subject[20].should eq('Twenty')
    subject[21].should eq('Twenty one')
    subject[30].should eq('Thirty')
    subject[32].should eq('Thirty two')
    subject[40].should eq('Forty')
    subject[43].should eq('Forty three')
    subject[50].should eq('Fifty')
    subject[54].should eq('Fifty four')
    subject[60].should eq('Sixty')
    subject[65].should eq('Sixty five')
    subject[70].should eq('Seventy')
    subject[76].should eq('Seventy six')
    subject[80].should eq('Eighty')
    subject[87].should eq('Eighty seven')
    subject[90].should eq('Ninety')
    subject[98].should eq('Ninety eight')
  end

  it 'joins number of hundreds, tens and ones' do
    subject[100].should eq('One hundred')
    subject[101].should eq('One hundred one')
    subject[111].should eq('One hundred eleven')
    subject[122].should eq('One hundred twenty two')

    subject[200].should eq('Two hundred')
    subject[202].should eq('Two hundred two')
    subject[212].should eq('Two hundred twelve')
    subject[233].should eq('Two hundred thirty three')

    subject[300].should eq('Three hundred')
    subject[303].should eq('Three hundred three')
    subject[313].should eq('Three hundred thirteen')
    subject[344].should eq('Three hundred forty four')

    subject[400].should eq('Four hundred')
    subject[404].should eq('Four hundred four')
    subject[414].should eq('Four hundred fourteen')
    subject[455].should eq('Four hundred fifty five')

    subject[500].should eq('Five hundred')
    subject[505].should eq('Five hundred five')
    subject[515].should eq('Five hundred fifteen')
    subject[566].should eq('Five hundred sixty six')

    subject[600].should eq('Six hundred')
    subject[606].should eq('Six hundred six')
    subject[616].should eq('Six hundred sixteen')
    subject[677].should eq('Six hundred seventy seven')

    subject[700].should eq('Seven hundred')
    subject[707].should eq('Seven hundred seven')
    subject[717].should eq('Seven hundred seventeen')
    subject[788].should eq('Seven hundred eighty eight')

    subject[800].should eq('Eight hundred')
    subject[808].should eq('Eight hundred eight')
    subject[818].should eq('Eight hundred eighteen')
    subject[899].should eq('Eight hundred ninety nine')

    subject[900].should eq('Nine hundred')
    subject[909].should eq('Nine hundred nine')
    subject[919].should eq('Nine hundred nineteen')
    subject[990].should eq('Nine hundred ninety')
  end

  it 'supports thousands' do
    subject[1000].should eq('One thousand')
    subject[1001].should eq('One thousand one')
    subject[1234].should eq('One thousand two hundred thirty four')
    subject[1999].should eq('One thousand nine hundred ninety nine')

    subject[2000].should eq('Two thousand')
    subject[2001].should eq('Two thousand one')
    subject[2345].should eq('Two thousand three hundred forty five')
    subject[2888].should eq('Two thousand eight hundred eighty eight')

    subject[3000].should eq('Three thousand')
    subject[4000].should eq('Four thousand')
    subject[5000].should eq('Five thousand')
    subject[6000].should eq('Six thousand')
    subject[7000].should eq('Seven thousand')
    subject[8000].should eq('Eight thousand')
    subject[9000].should eq('Nine thousand')
  end

  it 'supports tens of thousands' do
    subject[10000].should eq('Ten thousand')

    subject[11000].should eq('Eleven thousand')
    subject[12000].should eq('Twelve thousand')
    subject[13000].should eq('Thirteen thousand')
    subject[14000].should eq('Fourteen thousand')
    subject[15000].should eq('Fifteen thousand')
    subject[16000].should eq('Sixteen thousand')
    subject[17000].should eq('Seventeen thousand')
    subject[18000].should eq('Eighteen thousand')
    subject[19000].should eq('Nineteen thousand')
    subject[20000].should eq('Twenty thousand')

    subject[21000].should eq('Twenty one thousand')
    subject[22000].should eq('Twenty two thousand')
    subject[23000].should eq('Twenty three thousand')
    subject[24000].should eq('Twenty four thousand')
    subject[25000].should eq('Twenty five thousand')
    subject[26000].should eq('Twenty six thousand')
    subject[27000].should eq('Twenty seven thousand')
    subject[28000].should eq('Twenty eight thousand')
    subject[29000].should eq('Twenty nine thousand')

    subject[33000].should eq('Thirty three thousand')
    subject[44000].should eq('Forty four thousand')
    subject[55000].should eq('Fifty five thousand')
    subject[66000].should eq('Sixty six thousand')
    subject[77000].should eq('Seventy seven thousand')
    subject[88000].should eq('Eighty eight thousand')
    subject[99000].should eq('Ninety nine thousand')
  end

  it 'supports hundreds of thousands' do
    subject[100_000].should eq('One hundred thousand')

    subject[101_000].should eq('One hundred one thousand')
    subject[102_000].should eq('One hundred two thousand')
    subject[103_000].should eq('One hundred three thousand')
    subject[104_000].should eq('One hundred four thousand')
    subject[105_000].should eq('One hundred five thousand')
    subject[111_000].should eq('One hundred eleven thousand')
    subject[112_000].should eq('One hundred twelve thousand')
    subject[113_000].should eq('One hundred thirteen thousand')
    subject[222_000].should eq('Two hundred twenty two thousand')
    subject[333_000].should eq('Three hundred thirty three thousand')
    subject[444_000].should eq('Four hundred forty four thousand')
    subject[555_000].should eq('Five hundred fifty five thousand')
    subject[666_000].should eq('Six hundred sixty six thousand')
    subject[777_000].should eq('Seven hundred seventy seven thousand')
    subject[999_000].should eq('Nine hundred ninety nine thousand')
    subject[999_999].should eq('Nine hundred ninety nine thousand nine hundred ninety nine')
  end

  it 'supports millions' do
    subject[1_000_000].should eq('One million')
    subject[1_000_001].should eq('One million one')
    subject[1_001_001].should eq('One million one thousand one')
    subject[1_234_567].should eq('One million two hundred thirty four thousand five hundred sixty seven')
    subject[2_000_000].should eq('Two million')
    subject[3_303_303].should eq('Three million three hundred three thousand three hundred three')
    subject[4_004_000].should eq('Four million four thousand')
    subject[5_500_000].should eq('Five million five hundred thousand')
    subject[6_000_000].should eq('Six million')
    subject[7_000_000].should eq('Seven million')
    subject[9_000_000].should eq('Nine million')
  end

  it 'supports tens of millions' do
    subject[11_000_000].should eq('Eleven million')
    subject[13_000_000].should eq('Thirteen million')
    subject[15_000_000].should eq('Fifteen million')
    subject[19_000_000].should eq('Nineteen million')
    subject[20_000_000].should eq('Twenty million')
    subject[22_000_000].should eq('Twenty two million')
    subject[33_000_000].should eq('Thirty three million')
    subject[44_000_000].should eq('Forty four million')
    subject[55_000_000].should eq('Fifty five million')
    subject[66_000_000].should eq('Sixty six million')
    subject[77_000_000].should eq('Seventy seven million')
    subject[88_000_000].should eq('Eighty eight million')
    subject[99_000_000].should eq('Ninety nine million')
    subject[99_999_999].should eq('Ninety nine million nine hundred ninety nine thousand nine hundred ninety nine')
  end

  it 'supports hundreds of millions' do
    subject[100_000_000].should eq('One hundred million')
    subject[100_000_001].should eq('One hundred million one')
    subject[102_100_000].should eq('One hundred two million one hundred thousand')
    subject[222_000_000].should eq('Two hundred twenty two million')
    subject[333_000_000].should eq('Three hundred thirty three million')
    subject[400_000_000].should eq('Four hundred million')
    subject[500_000_000].should eq('Five hundred million')
    subject[600_000_000].should eq('Six hundred million')
    subject[700_000_000].should eq('Seven hundred million')
    subject[880_000_000].should eq('Eight hundred eighty million')
    subject[999_999_999].should eq('Nine hundred ninety nine million nine hundred ninety nine thousand nine hundred ninety nine')
  end

  it 'does not support billions' do
    expect { subject[1_000_000_000] }.to raise_error(ArgumentError)
  end

  describe 'floats' do
    it 'appends the decimal part as cents' do
      subject[1.23].should eq('One 23/100')
    end

    it 'displays two decimal digits' do
      subject[2.0].should eq('Two 00/100')
    end

    it 'rounds to two decimal places' do
      subject[3.456].should eq('Three 46/100')
    end
  end
end
