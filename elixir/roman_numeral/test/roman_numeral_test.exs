defmodule RomanNumeralTest do
  use ExUnit.Case
  import Checkov

  data_test "converts #{number} to #{numeral}" do
    assert RomanNumeral.convert(number) == numeral

    where [
      [:number, :numeral],
      [1, "I"],
      [3, "III"],
      [10, "X"],
      [14, "XIV"],
      [45, "XLV"],
      [59, "LIX"],
      [190, "CXC"],
      [1400, "MCD"],
      [2500, "MMD"],
      [3900, "MMMCM"],
      [3999, "MMMCMXCIX"]
    ]
  end

end
