defmodule BowlingGame.Day02Test do
  use ExUnit.Case, async: true

  alias BowlingGame.Day02, as: BowlingGame

  test "gutter game" do
    game = roll_many(20, 0)

    assert BowlingGame.score(game) == 0
  end

  test "all ones" do
    game = roll_many(20, 1)

    assert BowlingGame.score(game) == 20
  end

  test "one spare" do
    game = [4, 6] ++ [3] ++ roll_many(17, 0)

    assert BowlingGame.score(game) == 10 + 3 + 3
  end

  test "one strike" do
    game = [10] ++ [4, 3] ++ roll_many(16, 0)

    assert BowlingGame.score(game) == 10 + 4 + 3 + 4 + 3
  end

  test "perfect game" do
    game = roll_many(12, 10)

    assert BowlingGame.score(game) == 300
  end

  defp roll_many(times, pins), 
    do: for _ <- 1..times, do: pins
end
