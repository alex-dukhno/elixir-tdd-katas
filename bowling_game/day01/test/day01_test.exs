defmodule Day01Test do
  use ExUnit.Case

  alias Day01, as: Game

  setup do
    {:ok, game} = Game.new()
    %{game: game}
  end

  test "gutter game", %{game: game} do
    for _ <- 1..20 do
      Game.roll(game, 0)
    end

    assert Game.score(game) == 0
  end

  test "all ones", %{game: game} do
    for _ <- 1..20 do
      Game.roll(game, 1)
    end

    assert Game.score(game) == 20
  end

  test "one spare", %{game: game} do
    roll_spare(game)
    Game.roll(game, 3)

    for _ <- 1..17 do
      Game.roll(game, 0)
    end

    assert Game.score(game) == 16
  end

  test "one strike", %{game: game} do
    roll_strike(game)
    Game.roll(game, 3)
    Game.roll(game, 4)

    for _ <- 1..16 do
      Game.roll(game, 0)
    end

    assert Game.score(game) == 24
  end

  test "perfect game", %{game: game} do
    for _ <- 1..13 do
      Game.roll(game, 10)
    end

    assert Game.score(game) == 300
  end

  defp roll_spare(game) do
    Game.roll(game, 4)
    Game.roll(game, 6)
  end

  defp roll_strike(game) do
    Game.roll(game, 10)
  end
end
