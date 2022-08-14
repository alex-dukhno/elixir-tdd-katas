defmodule BowlingGame.Day06 do
  def score(game),
    do: score(game, 1)

  defp score(_game, 11), do: 0
  defp score(game, index),
    do: frame_score(game) +
        score(next_roll(game), index + 1)

  defp strike_bonus(game),
    do: game
        |> Enum.drop(1)
        |> Enum.take(2)
        |> Enum.sum()

  defp strike?(game),
    do: game
        |> Kernel.hd() == 10

  defp spare?(game),
    do: game
        |> Enum.take(2)
        |> Enum.sum() == 10

  defp spare_bonus(game),
    do: game
        |> Enum.drop(2)
        |> Kernel.hd()

  defp next_roll(game) do
    cond do
      strike?(game) -> Kernel.tl(game)
      true          -> Enum.drop(game, 2)
    end
  end

  defp frame_score(game) do
    cond do
      strike?(game) -> 10 + strike_bonus(game)
      spare?(game)  -> 10 + spare_bonus(game)
      true          -> (game |> Enum.take(2) |> Enum.sum())
    end
  end
end
