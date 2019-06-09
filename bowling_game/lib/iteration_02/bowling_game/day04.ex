defmodule BowlingGame.Day04 do
  def score(game),
    do: score(game, 1, 0)

  defp score(_game, 11, current_score), do: current_score
  defp score([10 | rest], index, current_score),
    do: score(rest, index + 1, 10 + current_score + strike_bonus(rest))
  defp score([_, _ | rest] = game, index, current_score),
    do: if spare?(game),
        do:   score(rest, index + 1, 10 + current_score + spare_bonus(rest)),
        else: score(rest, index + 1, frame(game) + current_score)

  defp strike_bonus(game),
    do: game
        |> Enum.take(2)
        |> Enum.sum()

  defp spare?(game),
    do: game
        |> frame() == 10

  defp spare_bonus(game),
    do: List.first(game)

  defp frame(game),
    do: game
        |> Enum.take(2)
        |> Enum.sum()
end
