defmodule BowlingGameKata.Day03 do
  import Enum
  import Kernel

  def score(game), do: score(game, 1, 0)

  def score(game, frame, score) do
    cond do
      frame == 11 ->
        score
      is_strike(game) ->
        score(tl(game), frame + 1, score + 10 + strike_bonus(game))
      is_spare(game) ->
        score(drop(game, 2), frame + 1, score + 10 + spare_bonus(game))
      true ->
        score(drop(game, 2), frame + 1, score + sum(take(game, 2)))
    end
  end

  def is_strike(game), do: hd(game) == 10
  def strike_bonus(game), do: sum(take(tl(game), 2))
  def is_spare(game), do: sum(take(game, 2)) == 10
  def spare_bonus(game), do: hd(drop(game, 2))
end
