defmodule TwelveDays do
  @gifts [
    first: "and a Partridge in a Pear Tree.",
    second: "two Turtle Doves,",
    third: "three French Hens,",
    fourth: "four Calling Birds,",
    fifth: "five Gold Rings,",
    sixth: "six Geese-a-Laying,",
    seventh: "seven Swans-a-Swimming,",
    eighth: "eight Maids-a-Milking,",
    ninth: "nine Ladies Dancing,",
    tenth: "ten Lords-a-Leaping,",
    eleventh: "eleven Pipers Piping,",
    twelfth: "twelve Drummers Drumming,"
  ]

  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(1) do
    "#{intro(1)} #{@gifts[ordinal(1)]}"
    |> String.replace("and ", "")
  end

  def verse(number) do
    1..number
    |> Enum.map(fn n -> @gifts[ordinal(n)] end)
    |> Enum.reverse
    |> List.insert_at(0, intro(number))
    |> Enum.join(" ")
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    starting_verse..ending_verse
    |> Enum.map(&verse/1)
    |> Enum.join("\n")
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing do
    verses(1, 12)
  end

  defp intro(number) do
    "On the #{ordinal(number)} day of Christmas my true love gave to me,"
  end

  defp ordinal(number) do
    @gifts
    |> Enum.at(number - 1)
    |> elem(0)
  end

end
