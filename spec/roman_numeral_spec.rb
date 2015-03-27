require_relative "../lib/roman_numeral"

describe RomanNumeral do
  describe "#convert_to_numeral" do
    it "returns I when passed 1" do
      roman = RomanNumeral.new
      expect(roman.convert_to_numeral 1).to eq "I"
    end

    it "returns III when passed 3" do
      roman = RomanNumeral.new
      expect(roman.convert_to_numeral 3).to eq "III"
    end

    it "returns IX when passed 9" do
      roman = RomanNumeral.new
      expect(roman.convert_to_numeral 9).to eq "IX"
    end
  end
end
