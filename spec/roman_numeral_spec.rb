require_relative "../lib/roman_numeral"

describe RomanNumeral do
  describe "#convert_to_numeral" do
    it "returns I when passed 1" do
      roman = RomanNumeral.new
      expect(roman.convert_to_numeral 1).to eq "I"
    end
  end
end
