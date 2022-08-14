defmodule BowlingGameKataTest.Day06 do
  use ExUnit.Case

  import BowlingGameKata.Day06

  defp roll_many(times, pins), do: for _ <- 1..times, do: pins
  defp spare(), do: [4, 6]

  test "gutter game", do:
    assert score(roll_many(20, 0)) == 0

  test "all ones", do:
    assert score(roll_many(20, 1)) == 20

  test "one spare", do:
    assert score(spare() ++ [3] ++ roll_many(17, 0)) == 10 + 3 + 3

  test "one strike", do:
    assert score([10] ++ [4, 3] ++ roll_many(16, 0)) == 10 + 4 + 3 + 4 + 3
end
