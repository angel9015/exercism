defmodule Dot do
  defmacro graph(ast), do: ast |> do_graph_outer(%Graph{}) |> Macro.escape()

  defp do_graph_outer([do: tup], acc), do: do_graph(tup, acc)

  defp do_graph({:__block__, _ctx, props}, acc), do: props |> Enum.reduce(acc, &block_reducer/2)
  defp do_graph({:graph, _ctx, [[]]}, %Graph{} = acc), do: acc

  defp do_graph({:graph, _ctx, [[props]]}, %Graph{} = acc),
    do: acc |> insert_element(:attrs, props)

  defp do_graph({:--, _ctx, props}, %Graph{} = acc),
    do: acc |> insert_element(:edges, parse_edges(props))

  defp do_graph({atom, _ctx, props}, %Graph{} = acc) when is_atom(atom),
    do: acc |> insert_element(:nodes, parse_atom(atom, props))

  defp do_graph(_not, _acc), do: raise(ArgumentError)

  defp block_reducer(stuff, acc), do: do_graph(stuff, acc)

  defp insert_element(acc, key, el), do: acc |> Map.update!(key, &([el | &1] |> Enum.sort()))

  defp parse_atom(atom, nil) when is_atom(atom), do: {atom, []}

  defp parse_atom(atom, [[err, _zz]]) when is_atom(atom) and is_binary(err),
    do: raise(ArgumentError)

  defp parse_atom(atom, [{{:., _a, _b}, _ctx, _z}]) when is_atom(atom),
    do: raise(ArgumentError)

  defp parse_atom(atom, [props]) when is_atom(atom), do: {atom, props}
  defp parse_atom(_v, _z), do: raise(ArgumentError)

  defp parse_edges([{atom1, _ctx1, nil}, {atom2, _ctx2, nil}]), do: {atom1, atom2, []}
  defp parse_edges([{atom1, _ctx1, nil}, {atom2, _ctx2, [props]}]), do: {atom1, atom2, props}
  defp parse_edges(_other), do: raise(ArgumentError)
end
