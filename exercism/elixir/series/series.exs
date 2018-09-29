defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) do
    ~r/.(?=(.{#{size - 1}}))/u
    |> Regex.scan(s)
    |> Enum.flat_map(fn [first, rest] -> [first <> rest] end)
  end
end
