defmodule BowlingGame.Day08Test do
  use ExUnit.Case, async: true

  alias BowlingGame.Day08, as: BowlingGame

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
    roll_spare(game)
    BowlingGame.roll(game, 3)
    roll_many(game, 17, 0)

    assert BowlingGame.score(game) == 10 + 3 + 3
  end

  test "one strike", %{game: game} do
    roll_strike(game)
    BowlingGame.roll(game, 4)
    BowlingGame.roll(game, 3)
    roll_many(game, 16, 0)

    assert BowlingGame.score(game) == 10 + 4 + 3 + 4 + 3
  end

  test "perfect game", %{game: game} do
    roll_many(game, 12, 10)

    assert BowlingGame.score(game) == 300
  end

  defp roll_many(game, times, pins),
       do: for _ <- 1..times,
           do: BowlingGame.roll(game, pins)

  defp roll_spare(game) do
    BowlingGame.roll(game, 4)
    BowlingGame.roll(game, 6)
  end

  defp roll_strike(game) do
    BowlingGame.roll(game, 10)
  end
end
