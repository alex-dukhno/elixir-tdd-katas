defmodule BowlingGame.Day14 do
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
  defp score(rolls, index) do
    score(next_frame(rolls), index + 1) + current_score(rolls)
  end

  defp current_score(rolls) do
    cond do
      strike?(rolls) -> 10 + strike_bonus(rolls)
      spare?(rolls) -> 10 + spare_bonus(rolls)
      true -> frame(rolls)
    end
  end

  defp next_frame(rolls) do
    cond do
      strike?(rolls) -> Enum.drop(rolls, 1)
      true -> Enum.drop(rolls, 2)
    end
  end

  defp strike?(rolls), do: hd(rolls) == 10

  defp strike_bonus(rolls), do:
    rolls
    |> next_frame()
    |> Enum.take(2)
    |> Enum.sum()

  defp spare?(rolls), do:
    rolls
    |> Enum.take(2)
    |> Enum.sum() == 10

  defp spare_bonus(rolls), do:
    rolls
    |> next_frame()
    |> List.first()

  defp frame(rolls), do:
    rolls
    |> Enum.take(2)
    |> Enum.sum()
end
