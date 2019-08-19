defmodule Tournament do
  @header_line "Team                           | MP |  W |  D |  L |  P\n"

  @team_initial_state_win %{
    matches: 1,
    wins: 1,
    draws: 0,
    losses: 0,
    points: 3
  }

  @team_initial_state_loss %{
    matches: 1,
    wins: 0,
    draws: 0,
    losses: 1,
    points: 0
  }

  @team_initial_state_draw %{
    matches: 1,
    wins: 0,
    draws: 1,
    losses: 0,
    points: 1
  }

  @doc """
  Given `input` lines representing two teams and whether the first of them won,
  lost, or reached a draw, separated by semicolons, calculate the statistics
  for each team's number of games played, won, drawn, lost, and total points
  for the season, and return a nicely-formatted string table.

  A win earns a team 3 points, a draw earns 1 point, and a loss earns nothing.

  Order the outcome by most total points for the season, and settle ties by
  listing the teams in alphabetical order.
  """
  @spec tally(input :: list(String.t())) :: String.t()
  def tally(input) do
    table =
      input
      |> Enum.reduce(%{}, &tally_reducer/2)
      |> Enum.into([])
      |> Enum.sort_by(&sort_tallys/1)
      |> Enum.map(&format_line/1)
      |> Enum.join("\n")

    @header_line <> table
  end

  defp sort_tallys({team_name, %{points: points}}) do
    {-points, team_name}
  end

  defp format_line(
         {team_name,
          %{matches: matches, wins: wins, losses: losses, draws: draws, points: points}}
       ) do
    "#{team_name |> String.pad_trailing(30)} |  #{matches} |  #{wins} |  #{draws} |  #{losses} |  #{
      points
    }"
  end

  defp tally_reducer(line, acc), do: tally_reducer_line(String.split(line, ";"), acc)
    
  defp tally_reducer_line([team1, team2, outcome], acc) when outcome in ["win", "loss", "draw"] do
    case outcome do
      "win" -> acc |> win(team1) |> lose(team2)
      "loss" -> acc |> win(team2) |> lose(team1)
      "draw" -> acc |> draw(team1) |> draw(team2)
    end
  end
  defp tally_reducer_line(_, acc), do: acc

  defp tt_inc(team_tally, key, val \\ 1) do
    team_tally |> Map.update!(key, &(&1 + val))
  end

  defp win(acc, team) do
    acc
    |> Map.update(
      team,
      @team_initial_state_win,
      &(&1 |> tt_inc(:matches) |> tt_inc(:wins) |> tt_inc(:points, 3))
    )
  end

  defp lose(acc, team) do
    acc
    |> Map.update(team, @team_initial_state_loss, &(&1 |> tt_inc(:matches) |> tt_inc(:losses)))
  end

  defp draw(acc, team) do
    acc
    |> Map.update(
      team,
      @team_initial_state_draw,
      &(&1 |> tt_inc(:matches) |> tt_inc(:draws) |> tt_inc(:points))
    )
  end
end
