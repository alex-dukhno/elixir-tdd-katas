defmodule BowlingGame.Day03 do
  def score(game),
    do: score(game, 1, 0)

  defp score(_game, 11, current_score), do: current_score
  defp score([10 | rest], index, current_score),
    do: score(rest, index + 1, current_score + 10 + strike_bonus(rest))
  defp score([_, _ | rest] = game, index, current_score),
    do:
      if spare?(game), 
      do:   score(rest, index + 1, current_score + frame_points(game) + spare_bonus(rest)),
      else: score(rest, index + 1, current_score + frame_points(game))

  defp spare?(game),
      do: game
          |> frame_points() == 10

  defp spare_bonus(game),
      do: game
          |> List.first()

  defp frame_points(game),
      do: game
          |> Enum.take(2)
          |> Enum.sum()

  defp strike_bonus(game),
      do: game
          |> Enum.take(2)
          |> Enum.sum()
end
