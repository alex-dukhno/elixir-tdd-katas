defmodule BowlingGameKata.Day06 do
  import Enum
  import Kernel

  def score(game), do: score(game, 1, 0)

  defp score(_, index, score) when index == 11, do: score
  defp score(game, index, score) do
    [first | [second | rest]] = game
    cond do
      first == 10 ->
        score([second | rest], index + 1, score + 10 + sum(take([second | rest], 2)))
      first + second == 10 ->
        score(rest, index + 1, score + 10 + hd(rest))
      true ->
        score(rest, index + 1, score + first + second)
    end
  end
end
