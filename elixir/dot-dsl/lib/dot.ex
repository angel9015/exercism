defmodule Dot do
  defmacro graph(ast) do
    quote do
      unquote(do_graph(ast, %Graph{}) |> Macro.escape())
    end
  end

  def do_graph([do: {:__block__, _ctx, props}], acc) do
    props |> Enum.reduce(acc, &do_block_reducer/2)
  end

  def do_graph([do: {:graph, _ctx, [[]]}], %Graph{} = acc), do: acc

  def do_graph([do: {:graph, _ctx, [[props]]}], %Graph{} = acc), do: acc |> insert_element(:attrs, props)


  def do_graph([do: {:--, _ctx, props}], %Graph{} = acc) do
    acc |> insert_element(:edges, do_graph_edges(props))
  end

  def do_graph([do: {atom, _ctx, props}], %Graph{} = acc) when is_atom(atom) do
    acc |> insert_element(:nodes, do_graph_atom(atom, props))
  end

  def do_graph([do: _not], _acc), do: raise(ArgumentError)

  defp do_block_reducer(stuff, acc), do: do_graph([do: stuff], acc)

  defp insert_element(acc, key, el), do: acc |> Map.update!(key, &([el | &1] |> Enum.sort()))

  def do_graph_atom({:., _a, _b}, _z), do: raise(ArgumentError)
  def do_graph_atom(atom, nil) when is_atom(atom), do: {atom, []}

  def do_graph_atom(atom, [[err, _zz]]) when is_atom(atom) and is_binary(err),
    do: raise(ArgumentError)

  def do_graph_atom(atom, [{{:., _a, _b}, _ctx, _z}]) when is_atom(atom), do: raise(ArgumentError)
  def do_graph_atom(atom, [props]) when is_atom(atom), do: {atom, props}
  def do_graph_atom(_v, _z), do: raise(ArgumentError)

  # [{:a, [line: 13], nil}, {:b, [line: 13], [[color: :blue]]}]
  def do_graph_edges([{atom1, _ctx1, nil}, {atom2, _ctx2, nil}]), do: {atom1, atom2, []}

  def do_graph_edges([{atom1, _ctx1, nil}, {atom2, _ctx2, [props]}]), do: {atom1, atom2, props}
  def do_graph_edges(_other), do: raise(ArgumentError)

  def graph_reducer({atom, props}, acc) do
    acc |> Map.update(:nodes, [], &[do_graph(atom, props) | &1])
  end
end
