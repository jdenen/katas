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
    arabic = 0
    
    NUMERAL_DICTIONARY.keys.select{ |str| str.length == 2 }.each do |key|
      match = numeral.slice! key
      arabic += NUMERAL_DICTIONARY[key] if match
    end
    
    until numeral.empty?
      NUMERAL_DICTIONARY.keys.select{ |str| str.length == 1 }.each do |key|
        match = numeral.slice! key
        arabic += NUMERAL_DICTIONARY[key] if match
      end
    end
    
    arabic
  end

  def defined_numbers
    NUMERAL_DICTIONARY.values.reverse
  end
end
