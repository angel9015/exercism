defmodule BracketPush do
  @pairs %{
    "[" => "]",
    "{" => "}",
    "(" => ")",
  }

  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    # Pass the string contents to the reducer and make sure the result is empty list
    # The accumulator will be used as a stack; open brackets will be put
    # at the head and closing brackets will remove the head *if* it matches
    str |> String.graphemes |> Enum.reduce(
      [], &reducer/2
    ) |> Enum.empty?
  end

  # Opening bracket case - just insert it to the head of the accumulator
  defp reducer(el, acc) when el in ["[", "{", "("] do
    [el|acc]
  end

  # Closing bracket case, check if the head of the accumulator is the proper
  # open bracket; if yes remove it; if no just insert the end bracket to the
  # accumulator
  defp reducer(el, [h|t]=acc) when el in ["]", "}", ")"] do
    if el == @pairs[h], do: t, else: [el|acc]
  end

  # On all other cases ignore the element and return the accumulator  
  defp reducer(_el, acc), do: acc
end
