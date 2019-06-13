defmodule BowlingGame.Day08 do
  def new_game() do
    {:ok, pid} = Agent.start_link(fn -> %{rolls: []} end)
    pid
  end

  def roll(game, pin),
      do: game
          |> Agent.update(
               fn %{rolls: rolls} ->
                 %{rolls: [pin | rolls]}
               end
             )

  def score(game),
      do: game
          |> Agent.get(
               fn %{rolls: rolls} ->
                 score(Enum.reverse(rolls), 1)
               end
             )

  defp score(_rolls, 11), do: 0
  defp score([10 | rest], index) do
    score(rest, index + 1) + 10 + Enum.sum(Enum.take(rest, 2))
  end
  defp score([first, second | rest], index) do
    if first + second == 10,
       do: score(rest, index + 1) + 10 + Kernel.hd(rest),
       else: score(rest, index + 1) + first + second
  end
end
