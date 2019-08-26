defmodule Bowling do
  require Integer

  @doc """
    Creates a new game of bowling that can be used to store the results of
    the game
  """
  use Agent

  @spec start() :: any
  def start do
    # with {:ok, pid} <- Agent.start_link(fn -> [] end), do: pid
    {:ok, pid} = Agent.start_link(fn -> [%{frame: 1}] end)
    pid
  end

  @doc """
    Records the number of pins knocked down on a single roll. Returns `any`
    unless there is something wrong with the given number of pins, in which
    case it returns a helpful message.
  """

  @spec roll(any, integer) :: any | String.t()
  def roll(_game, roll) when roll > 10, do: "Pin count exceeds pins on the lane"
  def roll(_game, roll) when roll < 0, do: "Negative roll is invalid"

  def roll(game, roll) do
    :ok = Agent.update(game, &set_state(&1, roll)) 
    game
  end

  @spec score(any) :: integer | String.t()
  def score(game) do
    # Agent.get(game, & &1) |> Enum.reverse() |> Enum.reduce(%{score: 0, p: nil, pp: nil}, &(&1 + &2)) |> Map.get(:score)
    Agent.get(game, & &1) |> do_score(0)
  end

  # defp set_state2(current_state, 10) when Integer.is_even(length(current_state)), do: [0 | [10 | current_state ]]
  # defp set_state2(current_state, 10), do: [10 | current_state ]
  # defp set_state2(current_state, roll), do: [roll| current_state]

  # Frame 10
  defp set_state([%{frame: 10, roll1: roll1, roll2: roll2} | rest], roll),
    do: [%{frame: 10, roll1: roll1, roll2: roll2, roll3: roll} | rest]

  defp set_state([%{frame: 10, roll1: roll1} | rest], roll),
    do: [%{frame: 10, roll1: roll1, roll2: roll} | rest]

  defp set_state([%{frame: 10} | rest], roll), do: [%{frame: 10, roll1: roll} | rest]

  # 1st roll, strike
  defp set_state([%{frame: frame} | rest], 10),
    do: [%{frame: frame + 1} | [%{frame: frame, roll1: 10} | rest]]

  # 2nd roll
  defp set_state([%{frame: frame, roll1: roll1} | rest], roll),
    do: [%{frame: frame + 1} | [%{frame: frame, roll1: roll1, roll2: roll} | rest]]

  # 1st roll, no strike
  defp set_state([%{frame: frame} | rest], roll), do: [%{frame: frame, roll1: roll} | rest]
  # 2nd roll, error
  defp set_state([%{frame: frame, roll1: roll1} | rest], roll) when roll1 + roll > 10,
    do: "Pin count exceeds pins on the lane"

  #defp score_reducer(%{frame: 10})

  # defp set_state([[frame: frame, roll1: roll1, roll2: roll2] | rest] = state, roll) do
  #  state
  # end

  @doc """
    Returns the score of a given game of bowling if the game is complete.
    If the game isn't complete, it returns a helpful message.
  """

  # Arb. frame
  defp do_score([current_frame | [next_frame | [next_next_frame | rest]]], total_score),
    do:
      do_score([next_frame | [next_next_frame | rest]], total_score + score_frame(current_frame, next_frame, next_next_frame))

  # Frame 9
  defp do_score([current_frame | [next_frame | []]], total_score),
    do: do_score( [next_frame | []], total_score + score_frame(current_frame, next_frame, []))

  # Frame 10
  defp do_score([current_frame | []], total_score),
    do: total_score

  # defp do_score(frames, total_score), do: total_score

  defp score_frame(%{roll1: 10}, %{roll1: 10}, %{roll1: roll1}), do: 10 + 10 + roll1
  defp score_frame(%{roll1: 10}, %{roll1: roll1, roll2: roll2}, _), do: 10 + roll1 + roll2

  defp score_frame(%{roll1: roll1, roll2: roll2}, %{roll1: nroll1}, _) when roll1 + roll2 == 10,
    do: 10 + nroll1

  defp score_frame(%{roll1: roll1, roll2: roll2}, _, _), do: roll1 + roll2

  # defp score_reducer([frame: _frame, roll1: 10]=f, %{score: score, p: p, pp: pp}), do: %{score: 10+score, p: :strike, pp: p}
  # defp score_reducer([frame: _frame, roll1: roll1, roll2: roll1], %{score: score, p: p, pp: pp}) when roll+roll2=10, do: %{score: 10+score, p: :spare, pp: p}
  # defp score_reducer([frame: _frame, roll1: roll1, roll2: roll1], %{score: score, p: p, pp: pp}), do: %{score: roll1+roll2+score, p: nil, pp: p}
  # defp score_reducer([frame: _frame, roll1: 10], %{score: score, p: p, pp: pp}), do: %{score: 10+score, p: :strike, pp: p}
end
