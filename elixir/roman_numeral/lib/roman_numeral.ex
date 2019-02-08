defmodule RomanNumeral do
  @lookup %{
    1 => "I",
    4 => "IV",
    5 => "V",
    9 => "IX",
    10 => "X",
    40 => "XL",
    50 => "L",
    90 => "XC",
    100 => "C",
    400 => "CD",
    500 => "D",
    900 => "CM",
    1000 => "M"
  }

  def convert(number) do
    {chars, _} =
      @lookup
      |> Map.keys
      |> Enum.reverse
      |> Enum.map_reduce(number, &do_convert/2)

    Enum.join(chars)
  end

  defp do_convert(_, 0), do: {"", 0}
  defp do_convert(n, acc) do
    quotient = div(acc, n)
    remainder = rem(acc, n)
    {String.duplicate(@lookup[n], quotient), remainder}
  end

end
