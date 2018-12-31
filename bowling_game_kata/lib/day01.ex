defmodule BowlingGameKata.Day01 do
  def score(game) do
    private_score(game, 1, 0)
  end

  def private_score(game, index, current_score) do
    cond do
      index == 11 ->
        current_score
      Enum.sum(Enum.take(game, 2)) == 10 ->
        private_score(Enum.drop(game, 2), index + 1, current_score + 10 + Kernel.hd(Enum.drop(game, 2)))
      Kernel.hd(game) == 10 ->
        private_score(Enum.drop(game, 1), index + 1, current_score + 10 + Enum.sum(Enum.take(Enum.drop(game, 1), 2)))
      true ->
        private_score(Enum.drop(game, 2), index + 1, current_score + Enum.sum(Enum.take(game, 2)))
    end
  end
end
