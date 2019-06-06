defmodule BowlingGame.Day02 do
  def score(game), do: score(game, 1, 0)

  defp score(_game, 11, current_score), do: current_score
  defp score([10 | rest], index, current_score),
    do: score(rest, index + 1, 10 + current_score + strike_bonus(rest))
  defp score(game, index, current_score), 
    do: score(spare?(game), game, index, current_score)

  defp score(_spare = true, [_, _ | rest], index, current_score),
    do: score(rest, index + 1, 10 + current_score + List.first(rest))

  defp score(_not_spare = false, [first, second | rest], index, current_score),
    do: score(rest, index + 1, first + second + current_score)

  defp strike_bonus(game),
    do: game
        |> Enum.take(2)
        |> Enum.sum()

  defp spare?(game),
    do: game
        |> Enum.take(2)
        |> Enum.sum() == 10
end
