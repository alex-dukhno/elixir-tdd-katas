defmodule BowlingGameKataTest.Day14 do
  use ExUnit.Case

  import BowlingGameKata.Day14

  defp roll_many(times, pins), do:
    for _ <- 1..times, do: pins

  test "gutter game", do:
    assert 20
           |> roll_many(0)
           |> score() == 0

  test "all ones", do:
    assert 20
           |> roll_many(1)
           |> score() == 20

  test "one spare", do:
    assert [4, 6] ++ [3] ++ roll_many(17, 0)
           |> score == 10 + 3 + 3

  test "one strike", do:
    assert [10] ++ [4, 3] ++ roll_many(16, 0)
           |> score == 10 + 4 + 3 + 4 + 3

  test "perfect game", do:
    assert roll_many(12, 10) |> score == 300
end
