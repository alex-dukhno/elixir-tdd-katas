defmodule Day03 do
  def new(), do: Agent.start_link(fn -> [] end)

  def roll(game, pins), do: Agent.update(game, fn rolls -> [pins | rolls] end)

  def score(game),
    do:
      Agent.get(game, & &1)
      |> Enum.reverse()
      |> inner_score(0)

  defp inner_score(_rolls, _frame = 10), do: 0
  defp inner_score([10 | rest], frame) do
    10 + Enum.at(rest, 0) + Enum.at(rest, 1) + inner_score(rest, frame + 1)
  end
  defp inner_score([pin1, pin2 | rest], frame) do
      if pin1 + pin2 == 10 do
        10 + Enum.at(rest, 0) + inner_score(rest, frame + 1)
      else
        pin1 + pin2 + inner_score(rest, frame + 1)
    end
  end
end
