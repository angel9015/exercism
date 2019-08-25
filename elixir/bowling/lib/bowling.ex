defmodule Bowling do
  @doc """
    Creates a new game of bowling that can be used to store the results of
    the game
  """
  use Agent

  @spec start() :: any
  def start do
    # with {:ok, pid} <- Agent.start_link(fn -> [] end), do: pid
    {:ok, pid} = Agent.start_link(fn -> [%{frame: 1, roll1: 0, roll2: 0}] end)
    pid
  end

  @doc """
    Records the number of pins knocked down on a single roll. Returns `any`
    unless there is something wrong with the given number of pins, in which
    case it returns a helpful message.
  """

  @spec roll(any, integer) :: any | String.t()
  def roll(_game, roll) when roll > 10 or roll < 0, do: "Error"

  # def roll([%{frame: n, roll_number: 1} | _rest] = state, 10),
  #  do: [%{frame: n + 1, roll_number: 1} | state]

  def roll(game, roll) do
    :ok = Agent.update(game, &set_state(&1, roll))
    game
  end

  defp set_state(%{frame: frame, roll1: roll1, roll2: roll2} = state, roll) do
    state
  end

  @doc """
    Returns the score of a given game of bowling if the game is complete.
    If the game isn't complete, it returns a helpful message.
  """

  @spec score(any) :: integer | String.t()
  def score(game) do
    # Agent.get(game, & &1) |> Enum.reduce(&(&1 + &2))
    0
  end
end
