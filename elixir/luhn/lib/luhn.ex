defmodule Luhn do
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
    |> Enum.reduce(0, fn {d, idx}, acc ->
      acc + if rem(idx, 2) == 0, do: d, else: luhn_double_digit(d)
    end)
    # And finally check the mod 10 and return true if it is 0
    |> rem(10) == 0
  end

  defp luhn_double_digit(d) do
    # This will return the 2*digit as it is if it is < 9 or it will the sum of the digits if it is >= 10
    # i.e 18 = 1+8 = 9
    d2 = d * 2
    if d2 > 9, do: 1 + (d2 - 10), else: d2
  end
end
