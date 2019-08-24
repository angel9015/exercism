defmodule Luhn do
  require Integer

  @doc """
  Checks if the given number is valid via the luhn formula
  """
  @spec valid?(String.t()) :: boolean
  def valid?(number) do
    if has_invalid_data(number) do
      false
    else
      number
      |> String.replace(~r/[ -]/, "")
      |> validate
    end
  end

  defp has_invalid_data(number), do: String.match?(number, ~r/[^0-9 ]/)

  defp validate("0"), do: false

  defp validate(digits) do
    digits
    |> String.graphemes()
    # Conver to integers
    |> Enum.map(&String.to_integer/1)
    # Reverse and add index
    |> Enum.reverse()
    |> Enum.with_index()
    # Then sum the digits either as they are or using the luhn_double_digit depeding on their idx
    |> Enum.reduce(0, &sum_reducer/2)
    # And finally check the mod 10 and return true if it is 0
    |> rem(10) == 0
  end

  defp sum_reducer({d, idx}, acc) when Integer.is_even(idx), do: acc + d
  defp sum_reducer({d, _idx}, acc), do: acc + luhn_double_digit(d)

  # This will return the 2*digit as it is if it is < 9 or it will the sum of the digits if it is >= 10
  # i.e 18 = 1+8 = 9
  defp luhn_double_digit(d) when d < 5, do: d * 2
  defp luhn_double_digit(d), do: d * 2 - 9
end
