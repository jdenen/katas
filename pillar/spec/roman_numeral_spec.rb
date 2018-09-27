require_relative "../lib/roman_numeral"

describe RomanNumeral do
  let(:roman){ RomanNumeral.new }
  
  describe "#convert_to_numeral" do
    it "returns I when passed 1" do
      expect(roman.convert_to_numeral 1).to eq "I"
    end

    it "returns III when passed 3" do
      expect(roman.convert_to_numeral 3).to eq "III"
    end

    it "returns IX when passed 9" do
      expect(roman.convert_to_numeral 9).to eq "IX"
    end

    it "returns CDXL when passed 444" do
      expect(roman.convert_to_numeral 444).to eq "CDXLIV"
    end

    it "returns DXC when passed 590" do
      expect(roman.convert_to_numeral 590).to eq "DXC"
    end

    it "returns MLXVI when passed 1066" do
      expect(roman.convert_to_numeral 1066).to eq "MLXVI"
    end

    it "returns MCMLXXXIX when passed 1989" do
      expect(roman.convert_to_numeral 1989).to eq "MCMLXXXIX"
    end
  end

  describe "#convert_to_arabic" do
    it "returns 1 when passed I" do
      expect(roman.convert_to_arabic "I").to eq 1
    end

    it "returns 3 when passed III" do
      expect(roman.convert_to_arabic "III").to eq 3
    end

    it "returns 9 when passed IX" do
      expect(roman.convert_to_arabic "IX").to eq 9
    end

    it "returns 1066 when passed MLXVI" do
      expect(roman.convert_to_arabic "MLXVI").to eq 1066
    end

    it "returns 1989 when passed MCMLXXXIX" do
      expect(roman.convert_to_arabic "MCMLXXXIX").to eq 1989
    end
  end
end
