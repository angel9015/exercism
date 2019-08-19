defmodule Tournament do
  @header_line "Team                           | MP |  W |  D |  L |  P\n"

  @team_data_win %{
    matches: 1,
    wins: 1,
    draws: 0,
    losses: 0,
    points: 3
  }

  @team_data_loss %{
    matches: 1,
    wins: 0,
    draws: 0,
    losses: 1,
    points: 0
  }

  @team_data_draw %{
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

  defp tally_reducer_line([team1, team2, "win"], acc),
    do: acc |> merger(team1, @team_data_win) |> merger(team2, @team_data_loss)

  defp tally_reducer_line([team1, team2, "loss"], acc),
    do: acc |> merger(team2, @team_data_win) |> merger(team1, @team_data_loss)

  defp tally_reducer_line([team1, team2, "draw"], acc),
    do: acc |> merger(team1, @team_data_draw) |> merger(team2, @team_data_draw)

  defp tally_reducer_line(_, acc), do: acc

  defp merger(acc, team, result) do
    acc
    |> Map.merge(%{team => result}, fn _k, stats1, stats2 ->
      stats1 |> Map.merge(stats2, fn _k, v1, v2 -> v1 + v2 end)
    end)
  end
end
