defmodule Dot do
  defmacro graph([do: {atom, _ctx, props}] = ast) do
    ast |> IO.inspect()
    atom |> IO.inspect()
    props |> IO.inspect()

    do_graph(atom, props)

    quote do
      %Graph{}
    end
  end

  def do_graph(atom, props) do
  end
end
