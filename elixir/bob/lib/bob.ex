defmodule Bob do
  def hey(input) do
    cond do
      input |> String.trim() == "" ->
        "Fine. Be that way!"

      input == input |> String.upcase() and input |> String.last() == "?" and
          input != input |> String.downcase() ->
        "Calm down, I know what I'm doing!"

      input == input |> String.upcase() and input != input |> String.downcase() ->
        "Whoa, chill out!"

      input |> String.last() == "?" ->
        "Sure."

      true ->
        "Whatever."
    end
  end
end
