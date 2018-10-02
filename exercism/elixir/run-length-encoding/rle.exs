defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(""), do: ""
  def encode(string) do
    String.codepoints(string)
    |> Enum.chunk_while([], &chunk/2, &after_chunk/1)
    |> Enum.map_join(&counter/1)
  end

  defp chunk(elem, []), do: {:cont, [elem]}
  defp chunk(elem, [prev|_] = acc) when elem == prev, do: {:cont, [elem|acc]}
  defp chunk(elem, acc), do: {:cont, Enum.reverse(acc), [elem]}

  defp after_chunk([]), do: {:cont, []}
  defp after_chunk(acc), do: {:cont, Enum.reverse(acc), []}

  defp counter([c]), do: [c]
  defp counter([c|_] = list), do: ["#{Enum.count(list)}#{c}"]

  @spec decode(String.t()) :: String.t()
  def decode(""), do: ""
  def decode(string) do
    ~r/(\d+[A-z\s]|\w|\s)/
    |> Regex.scan(string)
    |> Enum.map(fn [x | _] -> String.split(x, ~r/(?!\d)/, trim: true) end)
    |> Enum.map_join(&unfold/1)
  end

  defp unfold([c]), do: c
  defp unfold([n, c]), do: c |> String.duplicate(n |> String.to_integer)
end
