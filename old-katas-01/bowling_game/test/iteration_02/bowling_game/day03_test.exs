defmodule BowlingGame.Day03Test do
  use ExUnit.Case, async: true

  alias BowlingGame.Day03, as: BowlingGame

  test "gutter game" do
    game = roll_many(20, 0)

    assert BowlingGame.score(game) == 0
  end

  test "all ones" do
    game = roll_many(20, 1)

    assert BowlingGame.score(game) == 20
  end

  test "one spare" do
    game = roll_spare() ++ [3] ++ roll_many(17, 0)

    assert BowlingGame.score(game) == 10 + 3 + 3
  end

  test "one strike" do
    game = roll_strike() ++ [4, 3] ++ roll_many(16, 0)

    assert BowlingGame.score(game) == 10 + 4 + 3 + 4 + 3
  end

  test "perfect game" do
    game = roll_many(12, 10)

    assert BowlingGame.score(game) == 300
  end

  defp roll_many(times, pins),
    do: for _ <- 1..times, do: pins

  defp roll_spare(), do: [4, 6]

  defp roll_strike(), do: [10]
end
