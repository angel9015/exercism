defmodule Accumulate do
  @doc """
    Given a list and a function, apply the function to each list item and
    replace it with the function's return value.

    Returns a list.

    ## Examples

      iex> Accumulate.accumulate([], fn(x) -> x * 2 end)
      []

      iex> Accumulate.accumulate([1, 2, 3], fn(x) -> x * 2 end)
      [2, 4, 6]

  """

  @spec accumulate(list, (any -> any)) :: list
  def accumulate(l, fun), do: tr_acc(l, [], fun)
  # This is the tail recursinve (tr) version
  defp tr_acc([], acc, _fun), do: acc |> Enum.reverse

  defp tr_acc([h | t], acc, fun) do
    tr_acc(t, [fun.(h) | acc], fun)
  end

  # Non tail rec version
  # def accumulate([h | t], fun) do
  #  [fun.(h) | accumulate(t, fun)]
  # end
  # def accumulate([], _fun), do: []


end
