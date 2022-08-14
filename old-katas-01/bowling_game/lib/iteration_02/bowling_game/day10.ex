defmodule BowlingGame.Day10 do
  alias BowlingGame.Day10.Game

  def new_game() do
    {:ok, pid} = Task.start_link(fn -> Game.loop([]) end)
    pid
  end

  def roll(game, pins) do
    send(game, {:roll, pins})
    game
  end

  def score(game) do
    send(game, {:score, self()})
    receive do
      {:score, score} -> score
    end
  end

  defmodule Game do
    def loop(rolls) do
      receive do
        {:score, caller} ->
          send(caller, {:score, score(Enum.reverse(rolls), 1)})
          loop(rolls)
        {:roll, pins} ->
          loop([pins | rolls])
      end
    end

    defp score(_rolls, 11), do: 0
    defp score(game, index) do
      frame = cond do
        strike?(game) -> 10 + strike_bonus(game)
        spare?(game) -> 10 + spare_bonus(game)
        true -> frame(game)
      end
      score(next_roll(game), index + 1) + frame
    end

    defp strike?(game),
         do: game
             |> Kernel.hd() == 10

    defp strike_bonus(game),
         do: game
             |> Enum.drop(1)
             |> Enum.take(2)
             |> Enum.sum()

    defp spare?(game),
         do: game
             |> frame() == 10

    defp spare_bonus(game),
         do: game
             |> Enum.drop(2)
             |> Kernel.hd()

    defp next_roll(game) do
      cond do
        strike?(game) -> Enum.drop(game, 1)
        true -> Enum.drop(game, 2)
      end
    end

    defp frame(game),
         do: game
             |> Enum.take(2)
             |> Enum.sum()
  end
end
