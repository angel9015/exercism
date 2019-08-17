defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l), do: count_t(l, 0)

  defp count_t([], c), do: c
  defp count_t([_h | t], c), do: count_t(t, c + 1)

  @spec reverse(list) :: list
  def reverse(l), do: reverse_t(l, [])

  defp reverse_t([], acc), do: acc
  defp reverse_t([h | t], acc), do: reverse_t(t, [h | acc])

  @spec map(list, (any -> any)) :: list
  def map(l, f), do: map_t(l, f, [])

  defp map_t([], _f, acc), do: acc |> reverse
  defp map_t([h | t], f, acc), do: map_t(t, f, [f.(h) | acc])

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f), do: filter_t(l, f, [])
  defp filter_t([], _f, acc), do: acc |> reverse

  defp filter_t([h | t], f, acc) do
    if f.(h) do
      filter_t(t, f, [h | acc])
    else
      filter_t(t, f, acc)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([], acc, _f), do: acc
  def reduce([h|t], acc, f) do
    reduce(t, f.(h, acc), f)
  end

  @spec append(list, list) :: list
  def append(a, l), do: append_t(reverse(a), l)

  def append_t(a, []), do: reverse(a)
  def append_t(a, [h|t]), do: append_t([h|a], t)

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    concat_t(ll, [])
  end

  def concat_t([], acc), do: acc |> reverse
  def concat_t([[]|t], acc), do: concat_t(t, acc)
  def concat_t([[h|t1]|t], acc), do: concat_t([t1|t], [h|acc])


end
