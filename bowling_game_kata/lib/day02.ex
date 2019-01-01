defmodule BowlingGameKata.Day02 do
  import Kernel
  import Enum

  def score(game) do
    private_score(game, 1, 0)
  end

  def private_score(game, index, score) do
    cond do
      index == 11 ->
        score
      is_strike(game) ->
        private_score(drop(game, 1), index + 1, score + 10 + strike_bonus(game))
      is_spare(game) ->
        private_score(drop(game, 2), index + 1, score + 10 + spare_bonus(game))
      true ->
        private_score(drop(game, 2), index + 1, score + sum(take(game, 2)))
    end
  end

  def is_spare(game), do: sum(take(game, 2)) == 10

  def spare_bonus(game), do: hd(drop(game, 2))

  def is_strike(game), do: hd(game) == 10

  def strike_bonus(game), do: sum(take(drop(game, 1), 2))
end
