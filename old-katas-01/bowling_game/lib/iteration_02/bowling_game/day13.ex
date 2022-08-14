defmodule BowlingGame.Day13 do
  def new_game() do
    {:ok, pid} = Agent.start_link(fn -> [] end)
    pid
  end

  def roll(game, pins) do
    Agent.update(game, fn rolls -> [pins | rolls] end)
    game
  end

  def score(game) do
    Agent.get(game, fn rolls -> score(Enum.reverse(rolls), 1) end)
  end

  defp score(_rolls, 11), do: 0
  defp score(game, index), do:
    score(next_roll(game), index + 1) + frame_score(game)

  defp frame_score(game) do
    cond do
      strike?(game) -> 10 + strike_bonus(game)
      spare?(game) -> 10 + spare_bonus(game)
      true -> frame(game)
    end
  end

  defp strike?(game), do:
    hd(game) == 10

  defp strike_bonus(game), do:
    game
    |> next_roll()
    |> Enum.take(2)
    |> Enum.sum()

  defp spare?(game), do:
    game
    |> Enum.take(2)
    |> Enum.sum() == 10

  defp spare_bonus(game), do:
    game
    |> next_roll()
    |> List.first()

  defp next_roll(game) do
    cond do
      strike?(game) -> Enum.drop(game, 1)
      true -> Enum.drop(game, 2)
    end
  end

  defp frame(game), do:
    game
    |> Enum.take(2)
    |> Enum.sum()
end
