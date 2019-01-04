defmodule BowlingGameKata.Day05 do
  import Enum
  import Kernel

  def score(game), do: score(game, 1)

  defp score(game, index) do
    cond do
      index == 11 -> 0
      is_strike(game) -> strike_score(game) + score(next_frame(game), index + 1)
      is_spare(game) -> spare_score(game) + score(next_frame(game), index + 1)
      true -> frame_score(game) + score(next_frame(game), index + 1)
    end
  end

  defp next_frame(game) do
    cond do
      is_strike(game) -> drop(game, 1)
      true -> drop(game, 2)
    end
  end

  defp is_strike(game), do: hd(game) == 10
  defp strike_score(game), do: 10 + strike_bonus(game)
  defp strike_bonus(game), do: sum(take(tl(game), 2))

  defp is_spare(game), do: frame_score(game) == 10
  defp spare_score(game), do: 10 + spare_bonus(game)
  defp spare_bonus(game), do: hd(next_frame(game))

  defp frame_score(game), do: sum(take(game, 2))
end
