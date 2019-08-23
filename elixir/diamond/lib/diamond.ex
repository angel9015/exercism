defmodule Diamond do
  @doc """
  Given a letter, it prints a diamond starting with 'A',
  with the supplied letter at the widest point.
  """
  @spec build_shape(char) :: String.t()
  def build_shape(letter) do
    letter |> build_top() |> duplicate_top_and_print()
  end

  defp duplicate_top_and_print(top) do
    Enum.join(top ++ build_bottom(top), "\n") <> "\n"
  end

  defp build_bottom(top), do: top |> Enum.reverse() |> Enum.drop(1)

  defp build_top(letter) do
    ?A..letter |> Enum.map(&create_line(&1, letter))
  end

  defp c_to_s(c) do
    [c] |> List.to_string()
  end

  defp create_line(curr_letter, last_letter) do
    outer_spaces = " " |> String.duplicate(last_letter - curr_letter)

    if(curr_letter == ?A) do
      outer_spaces <> "A" <> outer_spaces
    else
      inner_spaces = " " |> String.duplicate(2 * (curr_letter - ?A) - 1)
      outer_spaces <> c_to_s(curr_letter) <> inner_spaces <> c_to_s(curr_letter) <> outer_spaces
    end
  end
end
