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

  def convert_to_arabic numeral, conversion = 0
    return conversion if numeral.empty?
    
    keys_by_length.reverse.each do |key|
      conversion += NUMERAL_DICTIONARY[key] if numeral.slice!(key)
    end

    convert_to_arabic numeral, conversion
  end

  private

  def keys_by_length
    NUMERAL_DICTIONARY.keys.sort{ |a, b| a.length <=> b.length }
  end

  def defined_numbers
    NUMERAL_DICTIONARY.values.reverse
  end
end
