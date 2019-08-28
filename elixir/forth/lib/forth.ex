defmodule Forth do
  @regex_define ~r/: ([[:graph:]]+) ([^;]+) ;/
  @regex_define_err ~r/: ([[:digit:]]+) ([^;]+) ;/
  @opaque evaluator :: %{stack: [], defs: []}

  @doc """
  Create a new evaluator. An evaluator is a map with two elements: The stack and an array of definitions (replace something with something else)
  """
  @spec new() :: evaluator
  def new() do
    %{stack: [], defs: []}
  end

  @doc """
  Evaluate an input string, updating the evaluator state.
  """
  @spec eval(evaluator, String.t()) :: evaluator
  def eval(%{stack: stack, defs: defs}, s) do
    # This uses regexp trickery to remove the definitions and replace them properly from the input string
    {new_string, new_defs} = s |> handle_definitions(defs)
    # after splitting the (free of definitons) string using the lexer function
    # it manipulates the stack for each token using the eval_reducer fucntion
    new_stack = new_string |> lexer() |> Enum.reduce(stack, &eval_reducer/2)
    %{stack: new_stack, defs: new_defs}
  end

  # This uses some regexp trickery to
  # 1 Make sure that no numbers are redefined
  # Extract new definitions (and remove them from string)
  # Replace all definitons with the correct string
  # Finally it returns the list of definitons (old+new) and the prepared string
  defp handle_definitions(s, defs) do
    if Regex.match?(@regex_define_err, s) do
      raise Forth.InvalidWord
    else
      new_defs = defs ++ Regex.scan(@regex_define, s)
      no_def = String.replace(s, @regex_define, "")

      fixed_s =
        new_defs
        |> Enum.reverse()
        |> Enum.reduce(no_def, fn [_match, replace, replace_with], acc ->
          String.replace(acc, replace, replace_with)
        end)

      {fixed_s, new_defs}
    end
  end

  # Split using any non alphanum and +-*/ characters; then convert numeric string to inegers using normalize
  defp lexer(s),
    do: s |> String.split(~r/[^[:alnum:]+\-*\/]+/iu, trim: true) |> Enum.map(&normalize/1)

  defp normalize(s) do
    case Integer.parse(s) do
      {num, _rest} -> num
      :error -> String.upcase(s)
    end
  end

  defp eval_reducer("OVER", []), do: raise(Forth.StackUnderflow)
  defp eval_reducer("OVER", [_el | []]), do: raise(Forth.StackUnderflow)
  defp eval_reducer("OVER", [el1 | [el2 | rest]]), do: [el2 | [el1 | [el2 | rest]]]
  defp eval_reducer("SWAP", []), do: raise(Forth.StackUnderflow)
  defp eval_reducer("SWAP", [_el | []]), do: raise(Forth.StackUnderflow)
  defp eval_reducer("SWAP", [el1 | [el2 | rest]]), do: [el2 | [el1 | rest]]
  defp eval_reducer("DROP", []), do: raise(Forth.StackUnderflow)
  defp eval_reducer("DROP", [_el | rest]), do: rest
  defp eval_reducer("DUP", []), do: raise(Forth.StackUnderflow)
  defp eval_reducer("DUP", [el | rest]), do: [el | [el | rest]]
  defp eval_reducer("/", [0 | [_op1 | _rest]]), do: raise(Forth.DivisionByZero)
  defp eval_reducer("/", [op2 | [op1 | rest]]), do: [div(op1, op2) | rest]

  defp eval_reducer(op, [op2 | [op1 | rest]]) when op in ["+", "-", "*"],
    do: [eval_op(op, op1, op2) | rest]

  defp eval_reducer(el, acc) when is_number(el), do: [el | acc]
  defp eval_reducer(_el, _acc), do: raise(Forth.UnknownWord)

  defp eval_op(op, op1, op2), do: apply(Kernel, String.to_atom(op), [op1, op2])

  @doc """
  Return the current stack as a string with the element on top of the stack
  being the rightmost element in the string.
  """
  @spec format_stack(evaluator) :: String.t()
  def format_stack(%{stack: stack}) do
    stack |> Enum.reverse() |> Enum.join(" ")
  end

  defmodule StackUnderflow do
    defexception []
    def message(_), do: "stack underflow"
  end

  defmodule InvalidWord do
    defexception word: nil
    def message(e), do: "invalid word: #{inspect(e.word)}"
  end

  defmodule UnknownWord do
    defexception word: nil
    def message(e), do: "unknown word: #{inspect(e.word)}"
  end

  defmodule DivisionByZero do
    defexception []
    def message(_), do: "division by zero"
  end
end
