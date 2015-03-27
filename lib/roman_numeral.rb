class RomanNumeral

  NUMERAL_DICTIONARY = {
    "I"   => 1,
    "III" => 3,
    "V"   => 5,
    "IX"  => 9,
    "X"   => 10,
    "L"   => 50,
    "C"   => 100,
    "CM"  => 900,
    "M"   => 1000
  }
  
  def convert_to_numeral num
    defined_numbers.each_with_object("") do |defined, numeral|
      next if num.zero?
      quotient, num = num.divmod(defined)
      numeral << NUMERAL_DICTIONARY.key(defined) * quotient
    end
  end

  def defined_numbers
    NUMERAL_DICTIONARY.values.reverse
  end
end
