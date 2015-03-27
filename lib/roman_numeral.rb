class RomanNumeral

  NUMERAL_DICTIONARY = {
    "I"   => 1,
    "III" => 3,
    "V"   => 5,
    "IX"  => 9,
    "X"   => 10,
    "L"   => 50,
    "M"   => 1000
  }
  
  def convert_to_numeral num
    defined_numbers.each_with_object([]) do |n, numeral|
      next if num.zero?
      quotient, num = num.divmod(n)
      numeral << NUMERAL_DICTIONARY.key(n) * quotient
    end.join
  end

  def defined_numbers
    NUMERAL_DICTIONARY.values.reverse
  end
end
