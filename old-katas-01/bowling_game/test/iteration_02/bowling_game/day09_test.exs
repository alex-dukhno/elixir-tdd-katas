defmodule BowlingGame.Day09Test do
  use ExUnit.Case, async: true

  alias BowlingGame.Day09, as: BowlingGame

  setup do: {:ok, game: BowlingGame.new_game()}

  test "gutter game", %{game: game} do
    roll_many(game, 20, 0)

    assert BowlingGame.score(game) == 0
  end

  test "all ones", %{game: game} do
    roll_many(game, 20, 1)

    assert BowlingGame.score(game) == 20
  end

  test "one spare", %{game: game} do
    game
    |> roll_spare()
    |> BowlingGame.roll(3)
    |> roll_many(17, 0)

    assert BowlingGame.score(game) == 10 + 3 + 3
  end

  test "one strike", %{game: game} do
    game
    |> roll_strike()
    |> BowlingGame.roll(4)
    |> BowlingGame.roll(3)
    |> roll_many(16, 0)

    assert BowlingGame.score(game) == 10 + 4 + 3 + 4 + 3
  end

  test "perfect game", %{game: game} do
    roll_many(game, 12, 10)

    assert BowlingGame.score(game) == 300
  end

  defp roll_many(game, times, pins),
       do: for _ <- 1..times,
           do: BowlingGame.roll(game, pins)

  defp roll_spare(game),
       do: game
           |> BowlingGame.roll(4)
           |> BowlingGame.roll(6)

  defp roll_strike(game),
       do: game
           |> BowlingGame.roll(10)
end
