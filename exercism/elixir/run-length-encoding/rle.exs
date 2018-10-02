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
    chunker = fn
      e, [] -> {:cont, [e]}
      e, [prev | _] = acc when e == prev -> {:cont, [e | acc]}
      e, acc -> {:cont, Enum.reverse(acc), [e]}
    end

    afterer = fn
      [] -> {:cont, []}
      acc -> {:cont, Enum.reverse(acc), []}
    end

    counter = fn
      [c] -> [c]
      [c | _] = list -> ["#{Enum.count(list)}#{c}"]
    end

    String.codepoints(string)
    |> Enum.chunk_while([], chunker, afterer)
    |> Enum.map(counter)
    |> Enum.join
  end

  @spec decode(String.t()) :: String.t()
  def decode(""), do: ""
  def decode(string) do
    ~r/(\d+[A-z\s]|\w|\s)/
    |> Regex.scan(string)
    |> Enum.map(fn [x | _] -> String.split(x, ~r/(?!\d)/, trim: true) end)
    |> Enum.map_join(&unfold/1)
  end

  defp unfold([c]), do: c
  defp unfold([n|[c]]), do: String.duplicate(c, String.to_integer(n))
end
