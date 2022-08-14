defmodule BowlingGameKataTest.Day01 do
  use ExUnit.Case

  def roll_many(pins, times) do
    for _ <- 1..times, do: pins
  end

  def roll_spare do
    [6, 4]
  end

  test "gutter game" do
    assert BowlingGameKata.Day01.score(roll_many(0, 20)) == 0
  end

  test "all ones" do
    assert BowlingGameKata.Day01.score(roll_many(1, 20)) == 20
  end

  test "one spare" do
    assert BowlingGameKata.Day01.score(roll_spare() ++ [3] ++ roll_many(0, 17)) == 16
  end

  test "one strike" do
    assert BowlingGameKata.Day01.score([10] ++ [3, 4] ++ roll_many(0, 16)) == 24
  end

  test "perfect game" do
    assert BowlingGameKata.Day01.score(roll_many(10, 12)) == 300
  end
end
