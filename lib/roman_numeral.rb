class RomanNumeral

  NUMERAL_DICTIONARY = {
    "I"   => 1,
    "IV"  => 4,
    "V"   => 5,
    "IX"  => 9,
    "X"   => 10,
    "XL"  => 40,
    "L"   => 50,
    "XC"  => 90,
    "C"   => 100,
    "CD"  => 400,
    "D"   => 500,
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

  def convert_to_arabic numeral
    1
  end

  def defined_numbers
    NUMERAL_DICTIONARY.values.reverse
  end
end
