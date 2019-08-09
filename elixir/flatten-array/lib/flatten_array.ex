defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list) do
    list |> Enum.reduce([], &reducer/2) |> Enum.reverse
  end

  defp reducer(le, acc) when is_list(le) do
    le |> Enum.reduce(acc, &reducer/2)
  end

  defp reducer(nil, acc) do
    acc
  end

  defp reducer(le, acc) do
    [le | acc]
  end

end
