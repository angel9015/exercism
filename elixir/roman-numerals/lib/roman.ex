defmodule Roman do
  @symbols [
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"}
  ]

  # The reducer checks to see if the current number is >= than the
  # number in the accumulator and if yes it will
  # * Update the result to be equal to the current symbol duplicated as many times as the div (accumulator number / current number),
  # * Update the acc number to be equal to the rem (accumulator number, current number)
  # for example if the accumulator number is 3521 and the current number/symbol is M/1000 and the accumulator is %{n: 3521, result: ""}
  # then the accumulator result will be "M" duplicated 3521 div 1000 = 3 times (i.e MMM)
  # and then accumulator n will be 3521 mod 1000 = 521.
  defp reducer({curr_num, curr_symb}, %{n: acc_num, result: _} = acc) do
    if acc_num >= curr_num,
      do:
        acc
        |> Map.update!(:result, &(&1 <> String.duplicate(curr_symb, div(acc_num, curr_num))))
        |> Map.update!(:n, &rem(&1, curr_num)),
      else: acc
  end

  @doc """
  Convert the number to a roman number.

  It will reduce on the defined symbols using the reducer and return the "result" key of the
  accumulator. It starts with an empty result and an initial number equal to the passed num
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) when is_integer(number) and number <= 3999 do
    @symbols
    |> Enum.reduce(
      %{
        n: number,
        result: ""
      },
      &reducer/2
    )
    |> Map.get(:result)
  end
end
