defmodule BowlingGame.Day05 do
  def score(game),
    do: score(game, 1)

  defp score(_game, 11), do: 0
  defp score([10 | rest], index),
    do: score(rest, index + 1) + 10 + strike_bonus(rest)
  defp score([_, _ | rest] = game, index),
    do: if spare?(game),
        do:   score(rest, index + 1) + 10 + spare_bonus(rest),
        else: score(rest, index + 1) + frame(game)

  defp strike_bonus(game),
        do: game
            |> Enum.take(2)
            |> Enum.sum()

  defp spare?(game),
        do: game
            |> frame() == 10

  defp spare_bonus(game),
        do: game
            |> List.first()

  defp frame(game),
        do: game
            |> Enum.take(2)
            |> Enum.sum()
end
