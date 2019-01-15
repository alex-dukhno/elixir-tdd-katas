defmodule BowlingGameKata.Day10 do
  import Enum
  import Kernel

  def score(game), do: score(game, 1, 0)

  defp score(_, index, score) when index == 11, do: score
  defp score(game, index, score) do
    cond do
      is_strike(game) ->
        score(drop(game, 1), index + 1, score + strike_score(game))
      is_spare(game) ->
        score(drop(game, 2), index + 1, score + spare_score(game))
      true ->
        score(drop(game, 2), index + 1, score + frame_score(game))
    end
  end

  defp strike_score(game), do: 10 + sum(take(tl(game), 2))
  defp is_strike(game), do: hd(game) == 10
  defp is_spare(game), do: frame_score(game) == 10
  defp spare_score(game), do: 10 + hd(drop(game, 2))
  defp frame_score(game), do: sum(take(game, 2))
end
