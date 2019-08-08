defmodule Roman do
  @symbols %{
    1 => "I",
    5 => "V",
    10 => "X",
    50 => "L",
    100 => "C",
    500 => "D",
    1000 => "M"
  }

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) when is_integer(number) and number < 10 do
    to_roman_digit({number, 1})
  end

  def numerals(number) when is_integer(number) and number < 100 do
    to_roman_digit({div(number, 10), 10}) <> numerals(rem(number, 10))
  end

  def numerals(number) when is_integer(number) and number < 1000 do
    to_roman_digit({div(number, 100), 100}) <> numerals(rem(number, 100))
  end

  def numerals(number) when is_integer(number) and number <= 3999 do
    to_roman_digit({div(number, 1000), 1000}) <> numerals(rem(number, 1000))
  end

  # Convert a digit to roman using different symbols depending on its base
  # i.e if the base is 1 it will use I V and X
  # if the base is 10 it will use X L and D
  defp to_roman_digit({digit, base}) do
    cond do
      digit in [1, 2, 3] -> @symbols[base] |> String.duplicate(digit)
      digit in [4] -> @symbols[base] <> @symbols[base * 5]
      digit in [5] -> @symbols[base * 5]
      digit in [6, 7, 8] -> @symbols[base * 5] <> (@symbols[base] |> String.duplicate(digit - 5))
      digit in [9] -> @symbols[base] <> @symbols[base * 10]
      digit == 0 -> ""
    end
  end
end
