defmodule BowlingGameKataTest.Day02 do
  use ExUnit.Case

  import BowlingGameKata.Day02

  def roll_many(pins, times), do: for _ <- 1..times, do: pins

  def roll_spare(), do: [6, 4]

  def roll_strike(), do: [10]

  test "gutter game",
       do: assert score(roll_many(0, 20)) == 0

  test "all ones",
       do: assert score(roll_many(1, 20)) == 20

  test "one spare",
       do: assert score(roll_spare() ++ [3] ++ roll_many(0, 17)) == 10 + 3 + 3

  test "one strike",
       do: assert score(roll_strike() ++ [4, 3] ++ roll_many(0, 16)) == 10 + 4 + 3 + 4 + 3

  test "perfect game",
       do: assert score(roll_many(10, 12)) == 300
end
