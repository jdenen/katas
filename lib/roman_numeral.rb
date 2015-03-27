class RomanNumeral

  NUMERAL_DICTIONARY = {
    "I"   => 1,
    "III" => 3,
    "IX"  => 9
  }
  
  def convert_to_numeral num
    NUMERAL_DICTIONARY.key num
  end
end
