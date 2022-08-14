defmodule BowlingGame.Day11 do
  alias BowlingGame.Day11.Game

  def new_game() do
    {:ok, pid} = Task.start_link(fn -> Game.play([]) end)
    pid
  end

  def roll(game, pin) do
    send(game, {:roll, pin})
    game
  end

  def score(game) do
    send(game, {:score, self()})
    receive do
      {:score, score} -> score
    end
  end

  defmodule Game do
    def play(rolls) do
      receive do
        {:score, caller} ->
          send(caller, {:score, score(Enum.reverse(rolls), 1)})
          play(rolls)
        {:roll, pin} ->
          play([pin | rolls])
      end
    end

    defp score(_rolls, 11), do: 0
    defp score(game, index),
         do: next_roll(game)
             |> score(index + 1)
             |> frame(game)

    defp strike?(game),
         do: game
             |> Kernel.hd() == 10

    defp spare?(game),
         do: game
             |> Enum.take(2)
             |> Enum.sum() == 10

    defp next_roll(game) do
      cond do
        strike?(game) -> Enum.drop(game, 1)
        true -> Enum.drop(game, 2)
      end
    end

    defp frame(current_score, game) do
      current_score + cond do
        strike?(game) -> 10 + strike_bonus(game)
        spare?(game) -> 10 + spare_bonus(game)
        true -> Enum.sum(Enum.take(game, 2))
      end
    end

    defp strike_bonus(game),
         do: game
             |> Enum.drop(1)
             |> Enum.take(2)
             |> Enum.sum()

    defp spare_bonus(game),
         do: game
             |> Enum.drop(2)
             |> Kernel.hd()
  end
end
