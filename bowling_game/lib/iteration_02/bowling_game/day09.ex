defmodule BowlingGame.Day09 do
  def new_game() do
    {:ok, pid} = Task.start_link(fn -> loop(%{rolls: []}) end)
    pid
  end

  defp loop(%{rolls: rolls}) do
    receive do
      {:score, caller} ->
        send caller, {:score, score(Enum.reverse(rolls), 1)}
        loop(%{rolls: rolls})
      {:roll, pins} ->
        loop(%{rolls: [pins | rolls]})
    end
  end

  defp score(_rolls, 11), do: 0
  defp score([10 | rest], index) do
    score(rest, index + 1) + 10 + (rest |> Enum.take(2) |> Enum.sum())
  end
  defp score([first, second | rest], index) do
    if first + second == 10,
    do:   score(rest, index + 1) + 10 + List.first(rest),
    else: score(rest, index + 1) + first + second
  end

  def roll(game, pins) do
    send game, {:roll, pins}
    game
  end

  def score(game) do
    send game, {:score, self()}
    receive do
      {:score, score} -> score
    end
  end
end
