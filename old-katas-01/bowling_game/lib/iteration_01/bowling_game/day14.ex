defmodule BowlingGameKata.Day14 do
  import Enum
  import Kernel

  def score(game), do: game |> score(1, 0)

  defp score(_, index, score) when index == 11, do: score
  defp score(game, index, score) do
    cond do
      game |> is_strike ->
        score(game |> tl, index + 1, score + 10 + (game |> strike_bonus))
      game |> is_spare ->
        score(game |> drop(2), index + 1, score + 10 + (game |> spare_bonus))
      true ->
        score(game |> drop(2), index + 1, score + (game |> frame_score))
    end
  end

  defp frame_score(game), do: game |> take(2) |> sum
  defp is_spare(game), do: game |> frame_score == 10
  defp spare_bonus(game), do: game |> drop(2) |> hd
  defp is_strike(game), do: game |> hd == 10
  defp strike_bonus(game), do: game |> tl |> take(2) |> sum
end
