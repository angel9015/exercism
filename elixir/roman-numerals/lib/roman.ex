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
  def numerals(number) when is_integer(number) and number <= 3999 do
    number
    # Let's suppose we have 42
    |> digits_as_list
    # It will be converted to [4,2]
    |> Enum.reverse()
    # Will be reversed ie [2,4] to properly add the 10 powers
    |> add_ten_power_indeces
    # Now we'll have [{2,1}, {4,10}]
    |> Enum.map(&to_roman_digit/1)
    # Each digit+power will be converted accordingly i.e it will be
    # ["II", "XL"]
    |> Enum.reverse()
    # Reverse again to have the correct order ie ["XL", "II"]
    |> Enum.join()

    # Return the joined string "XLII'
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

  # Add a proper power of 10 to the digits for example
  # [1,2,3] will be converted to
  # [{1, 10^0}, {2, 10^1}, {3, 10^2}]==
  # [{1, 1}, {2, 10}, {3, 100}]
  defp add_ten_power_indeces(digits) do
    digits
    |> Enum.with_index()
    |> Enum.map(fn {d, i} -> {d, :math.pow(10, i) |> round} end)
  end

  # Return the digits of a number as a list, i.e 123 will return [1,2,3]
  defp digits_as_list(n) do
    n
    |> Integer.to_string()
    |> String.graphemes()
    |> Enum.map(&(&1 |> Integer.parse() |> elem(0)))
  end
end
