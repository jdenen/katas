defmodule Bob do

  def hey(input) do
    matcher = fn pattern ->
      String.match?(input, pattern)
    end

    cond do
      matcher.(~r/(?=^[[:blank:]]*$)/)
        -> "Fine. Be that way!"
      matcher.(~r/(?=^[^[:lower:]]*$)(?=^.*[[:upper:]]{1,}.*$)(?=.*\?$)/)
        -> "Calm down, I know what I'm doing!"
      matcher.(~r/(?=^[^[:lower:]]*$)(?=^.*[[:upper:]]{1,}.*$)/)
        -> "Whoa, chill out!"
      matcher.(~r/.*\?$/)
        -> "Sure."
      true
        -> "Whatever."
    end
  end

end
