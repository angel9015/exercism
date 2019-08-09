defmodule Bob do
  def hey(input) do
    cond do
      input |> String.trim() == "" ->
        "Fine. Be that way!"

      input == input |> String.upcase() and input |> String.last() == "?" and
          input |> String.match?(~r/[[:alpha:]]/) ->
        "Calm down, I know what I'm doing!"

      input == input |> String.upcase() and input |> String.match?(~r/[[:alpha:]]/) ->
        "Whoa, chill out!"

      input |> String.last() == "?" ->
        "Sure."

      true ->
        "Whatever."
    end
  end
end
