defmodule SaddlePoints do
  @doc """
  Parses a string representation of a matrix
  to a list of rows
  """
  @spec rows(String.t()) :: [[integer]]
  def rows(str), do: str |> String.split("\n") |> Enum.map(&split_and_parse/1)

  defp split_and_parse(line), do: line |> String.split(" ") |> Enum.map( &(&1|>Integer.parse|>elem(0)))

  @doc """
  Parses a string representation of a matrix
  to a list of columns
  """
  @spec columns(String.t()) :: [[integer]]
  def columns(str), do: str |> rows() |> transpose()

  defp transpose(matrix), do: matrix |>  List.zip |> Enum.map(&Tuple.to_list/1)


  @doc """
  Calculates all the saddle points from a string
  representation of a matrix
  """
  @spec saddle_points(String.t()) :: [{integer, integer}]
  def saddle_points(str) do
    # The order shouldn't matter but since it does matter I need to reverse here
    get_saddle_points(rows(str), columns(str)) |> Enum.reverse
  end

  defp get_saddle_points(rs, cs) do
    rs |> Enum.with_index |> Enum.reduce([], fn {row, rowIdx}, acc -> 
      row_max = Enum.max(row)
      row |> Enum.with_index |> Enum.reduce(acc, fn {el, elIdx}, elAcc -> 
        if(el == row_max) do
          col_min = cs |> Enum.at(elIdx) |> Enum.min()
          if el == col_min do
            [{rowIdx, elIdx} | elAcc]
          else
            elAcc
          end
        else
          elAcc
        end
      end)
    end)
  end
end
