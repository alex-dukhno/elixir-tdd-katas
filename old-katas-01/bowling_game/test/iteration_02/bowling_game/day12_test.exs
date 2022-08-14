defmodule BowlingGame.Day12Test do
  use ExUnit.Case, async: true

  alias BowlingGame.Day12, as: BowlingGame

  setup do: {:ok, game: BowlingGame.new_game()}

  test "gutter game", %{game: game}, do:
    assert game
           |> roll_many(20, 0)
           |> BowlingGame.score() == 0

  test "all ones", %{game: game}, do:
    assert game
           |> roll_many(20, 1)
           |> BowlingGame.score() == 20

  test "one spare", %{game: game}, do:
    assert game
           |> roll_spare()
           |> BowlingGame.roll(3)
           |> roll_many(17, 0)
           |> BowlingGame.score() == 10 + 3 + 3

  test "one strike", %{game: game}, do:
    assert game
           |> BowlingGame.roll(10)
           |> BowlingGame.roll(3)
           |> BowlingGame.roll(4)
           |> roll_many(16, 0)
           |> BowlingGame.score() == 10 + 4 + 3 + 4 + 3

  test "perfect game", %{game: game}, do:
    assert game
           |> roll_many(12, 10)
           |> BowlingGame.score() == 300

  defp roll_many(game, times, pins) do
    for _ <- 1..times, do:
      BowlingGame.roll(game, pins)
    game
  end

  defp roll_spare(game), do:
    game
    |> BowlingGame.roll(4)
    |> BowlingGame.roll(6)
end
