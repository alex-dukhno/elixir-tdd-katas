defmodule Day01 do
  def new(), do: Agent.start_link(fn -> [] end)

  def roll(game, pins), do: game |> Agent.update(fn state -> [pins | state] end)

  def score(game), do:
    game
    |> Agent.get(& &1)
    |> Enum.reverse()
    |> inner_score(0)

  defp inner_score(_rolls, _roll = 10), do: 0
  defp inner_score([10 | rest] = _rolls, roll),
    do: 10 + Enum.at(rest, 0) + Enum.at(rest, 1) + inner_score(rest, roll + 1)
  defp inner_score([pin1, pin2 | rest] = _rolls, roll) do
    if pin1 + pin2 == 10 do
      10 + Enum.at(rest, 0) + inner_score(rest, roll + 1)
    else
      pin1 + pin2 + inner_score(rest, roll + 1)
    end
  end
end
