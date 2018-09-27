defmodule Words do
  @non_words ~r/[^[:alnum:]\-]/u

  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    String.downcase(sentence)
    |> String.replace(@non_words, " ")
    |> String.split
    |> Enum.reduce(%{}, &reducer/2)
  end

  defp reducer(word, map) do
    Map.update(map, word, 1, fn mapval -> mapval + 1 end)
  end
end
