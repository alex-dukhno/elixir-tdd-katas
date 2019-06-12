defmodule BowlingGame.Day07 do
  def new_game(), do: %{rolls: []}

  def roll(game, pin),
      do: Map.update!(game, :rolls, fn rolls -> [pin | rolls] end)

  def score(%{rolls: rolls}),
      do: rolls
          |> Enum.reverse()
          |> score(1)

  defp score(_rolls, 11), do: 0
  defp score(game, index),
       do: frame_score(game) + score(next_roll(game), index + 1)

  defp frame_score(game) do
    cond do
      strike?(game) -> 10 + strike_bonus(game)
      spare?(game) -> 10 + spare_bonus(game)
      true -> frame(game)
    end
  end

  defp next_roll(game) do
    cond do
      strike?(game) -> Enum.drop(game, 1)
      true -> Enum.drop(game, 2)
    end
  end

  defp strike?([10 | _]), do: true
  defp strike?(_game), do: false

  defp strike_bonus(game),
       do: game
           |> Enum.drop(1)
           |> Enum.take(2)
           |> Enum.sum()

  defp spare?(game),
       do: game
           |> Enum.take(2)
           |> Enum.sum() == 10

  defp spare_bonus(game),
       do: game
           |> Enum.drop(2)
           |> List.first()

  defp frame(game),
       do: game
           |> Enum.take(2)
           |> Enum.sum()
end
