defmodule Day03Test do
  use ExUnit.Case

  alias Day03, as: Game

  setup do
    {:ok, game} = Game.new()
    %{game: game}
  end

  defp roll_many(game, times, pins) do
    for _ <- 1..times do
      Game.roll(game, pins)
    end
  end

  defp roll_spare(game) do
    Game.roll(game, 4)
    Game.roll(game, 6)
  end

  defp roll_strike(game) do
    Game.roll(game, 10)
  end

  test "gutter game", %{game: game} do
    roll_many(game, 20, 0)

    assert Game.score(game) == 0
  end

  test "all ones", %{game: game} do
    roll_many(game, 20, 1)

    assert Game.score(game) == 20
  end

  test "one spare", %{game: game} do
    roll_spare(game)
    Game.roll(game, 3)
    roll_many(game, 17, 0)

    assert Game.score(game) == 16
  end

  test "one strike", %{game: game} do
    roll_strike(game)
    Game.roll(game, 4)
    Game.roll(game, 3)
    roll_many(game, 16, 0)

    assert Game.score(game) == 24
  end

  test "perfect game", %{game: game} do
    roll_many(game, 13, 10)

    assert Game.score(game) == 300
  end
end
