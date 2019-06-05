defmodule BowlingGame.Day01 do
  def score(game),
    do: score(game, 1, 0)

  defp score(_, _roll_index = 11, current_score), do: current_score

  defp score([roll | rest], roll_index, current_score) when roll == 10,
    do: score(rest, roll_index + 1, current_score + 10 + strike_bonus(rest))

  defp score(game, roll_index, current_score),
    do: score(is_spare(game), game, roll_index, current_score)

  defp score(_spare = true, [_first, _second | rest], roll_index, current_score),
    do: score(rest, roll_index + 1, current_score + 10 + spare_bonus(rest))

  defp score(_not_spare = false, [first, second | rest], roll_index, current_score),
    do: score(rest, roll_index + 1, current_score + first + second)

  defp strike_bonus(game), do: game |> Enum.take(2) |> Enum.sum()
  defp is_spare(game), do: game |> Enum.take(2) |> Enum.sum() == 10
  defp spare_bonus(game), do: game |> List.first()
end
