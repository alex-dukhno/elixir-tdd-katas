defmodule BowlingGameKata.Day04 do

  import Enum
  import Kernel

  def score(game), do: score(game, 1, 0)

  defp score(game, index, score) do
    cond do
      index == 11 ->
        score
      is_strike(game) ->
        score(drop(game, 1), index + 1, score + 10 + strike_bonus(game))
      is_spare(game) ->
        score(drop(game, 2), index + 1, score + 10 + spare_bonus(game))
      true ->
        score(drop(game, 2), index + 1, score + sum(take(game, 2)))
    end
  end

  defp is_strike(game), do:
    hd(game) == 10

  defp strike_bonus(game), do:
    sum(take(tl(game), 2))

  defp is_spare(game), do:
    sum(take(game, 2)) == 10

  defp spare_bonus(game), do:
    hd(drop(game, 2))
end
