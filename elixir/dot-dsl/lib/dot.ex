defmodule Dot do
  _help = """
  [do: {:__block__, [], []}]
  %Graph{}

  [do: {:a, [line: 12], nil}]
  %Graph{nodes: [{:a, []}]}


  [do: {:a, [line: 13], [[color: :green]]}]
  %Graph{nodes: [{:a, [color: :green]}]}

  [do: {:--, [line: 11], [{:a, [line: 11], nil}, {:b, [line: 11], nil}]}]
  %Graph{edges: [{:a, :b, []}]}

  [do: {:graph, [line: 16], [[foo: 1]]}]
  %Graph{attrs: [foo: 1]}

  [
    do: {:__block__, [],
     [
       {:graph, [line: 6], [[foo: 1]]},
       {:graph, [line: 7], [[title: "Testing Attrs"]]},
       {:graph, [line: 8], [[]]},
       {:a, [line: 9], [[color: :green]]},
       {:c, [line: 10], [[]]},
       {:b, [line: 11], [[label: "Beta!"]]},
       {:--, [line: 12], [{:b, [line: 12], nil}, {:c, [line: 12], [[]]}]},
       {:--, [line: 13], [{:a, [line: 13], nil}, {:b, [line: 13], [[color: :blue]]}]},
       {:graph, [line: 14], [[bar: true]]}
     ]}
  ]
  %Graph{
      attrs: [bar: true, foo: 1, title: "Testing Attrs"],
      nodes: [{:a, [color: :green]}, {:b, [label: "Beta!"]}, {:c, []}],
      edges: [{:a, :b, [color: :blue]}, {:b, :c, []}]
  }

  """

  defmacro graph(ast) do
    quote do
      unquote(do_graph(ast, %Graph{}) |> Macro.escape())
    end
  end

  def do_graph([do: {:__block__, _ctx, props}], acc) do
    props |> Enum.reduce(acc, &do_block_reducer/2)
  end

  def do_graph([do: {:graph, _ctx, [[]]}], %Graph{} = acc), do: acc

  def do_graph([do: {:graph, _ctx, [[props]]}], %Graph{} = acc) do
    acc |> insert_element(:attrs, props)
  end

  def do_graph([do: {:--, _ctx, props}], %Graph{} = acc) do
    acc |> insert_element(:edges, do_graph_edges(props))
  end

  def do_graph([do: {atom, _ctx, props}], %Graph{} = acc) when is_atom(atom) do
    acc |> insert_element(:nodes, do_graph_atom(atom, props))
  end

  def do_graph([do: _not], _acc), do: raise ArgumentError

  defp do_block_reducer(stuff, acc), do: do_graph([do: stuff], acc)

  defp insert_element(acc, key, el) do
    acc |> Map.update!(key, &([el | &1] |> Enum.sort()))
  end

  def do_graph_atom({:., _a, _b}, _z), do: raise(ArgumentError)
  def do_graph_atom(atom, nil) when is_atom(atom), do: {atom, []}
  def do_graph_atom(atom, [[err, _zz]]) when is_atom(atom) and is_binary(err), do: raise(ArgumentError)
  def do_graph_atom(atom, [{{:., _a, _b}, _ctx, _z}]) when is_atom(atom), do: raise(ArgumentError)
  def do_graph_atom(atom, [props]) when is_atom(atom), do: {atom, props}
  def do_graph_atom(_v, _z), do: raise(ArgumentError)

  # [{:a, [line: 13], nil}, {:b, [line: 13], [[color: :blue]]}]
  def do_graph_edges([{atom1, _ctx1, nil}, {atom2, _ctx2, nil}]), do: {atom1, atom2, []}

  def do_graph_edges([{atom1, _ctx1, nil}, {atom2, _ctx2, [props]}]), do: {atom1, atom2, props}
  def do_graph_edges(_other), do: raise(ArgumentError)

  # def graph2

  def graph_reducer({atom, props}, acc) do
    acc |> Map.update(:nodes, [], &[do_graph(atom, props) | &1])
  end
end
