defmodule Bowling do
  require Integer

  @doc """
    Creates a new game of bowling that can be used to store the results of
    the game
  """
  @spec start() :: any
  def start do
    [{}]
  end

  @doc """
    Records the number of pins knocked down on a single roll. Returns `any`
    unless there is something wrong with the given number of pins, in which
    case it returns a helpful message.
  """

  @spec roll(any, integer) :: any | String.t()
  def roll(_game, roll) when roll > 10, do: {:error, "Pin count exceeds pins on the lane"}
  def roll(_game, roll) when roll < 0, do: {:error, "Negative roll is invalid"}

  def roll([{} | rest], 10) when length(rest) == 9, do: [{10} | rest]
  def roll([{} | rest], 10), do: [{}, {10} | rest]
  def roll([{} | rest], roll), do: [{roll} | rest]

  def roll([{r1} | rest], roll) when length(rest) == 9, do: [{r1, roll} | rest]

  def roll([{10, r2} | rest], roll) when length(rest) == 9 and r2 != 10 and r2 + roll > 10,
    do: {:error, "Pin count exceeds pins on the lane"}

  def roll([{10, r2} | rest], 10) when length(rest) == 9 and r2 != 10,
    do: {:error, "Pin count exceeds pins on the lane"}

  def roll([{r1, r2} | rest], _roll) when length(rest) == 9 and r1 + r2 < 10,
    do: {:error, "Cannot roll after game is over"}

  def roll([{r1, r2} | rest], roll) when length(rest) == 9, do: [{r1, r2, roll} | rest]

  def roll([{r1} | _rest], roll) when r1 + roll > 10,
    do: {:error, "Pin count exceeds pins on the lane"}

  def roll([{r1} | rest], roll), do: [{}, {r1, roll} | rest]

  @spec score(any) :: integer | String.t()
  def score(game) when length(game) < 10,
    do: {:error, "Score cannot be taken until the end of the game"}

  def score([{r1} | rest]) when length(rest) == 9 and r1 == 10,
    do: {:error, "Score cannot be taken until the end of the game"}

  def score([{r1, r2} | rest]) when length(rest) == 9 and r1 + r2 >= 10,
    do: {:error, "Score cannot be taken until the end of the game"}

  def score(game) do
    game |> Enum.reverse() |> do_score(0)
  end

  defp do_score([], score), do: score
  defp do_score([{r1, r2, r3}], score), do: score + r1 + r2 + r3
  defp do_score([{10} | rest], score), do: do_score(rest, score + 10 + strike(rest))

  defp do_score([{r1, r2} | rest], score) when r1 + r2 == 10,
    do: do_score(rest, score + 10 + spare(rest))

  defp do_score([{r1, r2} | rest], score), do: do_score(rest, score + r1 + r2)

  defp strike([{r1, r2} | _rest]), do: r1 + r2
  defp strike([{r1}, {r2} | _rest]), do: r1 + r2
  defp strike([{r1}, {r2, _} | _rest]), do: r1 + r2
  defp strike([{r1}, {r2, _, _}]), do: r1 + r2
  defp strike([{r1, r2, _}]), do: r1 + r2

  defp spare([{r1} | _rest]), do: r1
  defp spare([{r1, _r2} | _rest]), do: r1
end
