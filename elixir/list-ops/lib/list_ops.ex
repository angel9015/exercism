defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l), do: do_count(l, 0)

  defp do_count([], c), do: c
  defp do_count([_h | t], c), do: do_count(t, c + 1)

  @spec reverse(list) :: list
  def reverse(l), do: do_reverse(l, [])

  defp do_reverse([], acc), do: acc
  defp do_reverse([h | t], acc), do: do_reverse(t, [h | acc])

  @spec map(list, (any -> any)) :: list
  def map(l, f), do: do_map(l, f, [])

  defp do_map([], _f, acc), do: reverse(acc)
  defp do_map([h | t], f, acc), do: do_map(t, f, [f.(h) | acc])

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f), do: do_filter(l, f, [])

  defp do_filter([], _f, acc), do: reverse(acc)

  defp do_filter([h | t], f, acc) do
    if f.(h) do
      do_filter(t, f, [h | acc])
    else
      do_filter(t, f, acc)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([], acc, _f), do: acc

  def reduce([h | t], acc, f) do
    reduce(t, f.(h, acc), f)
  end

  @spec append(list, list) :: list
  def append(a, l), do: do_append(reverse(a), l)

  def do_append(a, []), do: reverse(a)
  def do_append(a, [h | t]), do: do_append([h | a], t)

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    do_concat(ll, [])
  end

  def do_concat([], acc), do: reverse(acc)
  def do_concat([[] | t], acc), do: do_concat(t, acc)
  def do_concat([[h | t1] | t], acc), do: do_concat([t1 | t], [h | acc])
end
