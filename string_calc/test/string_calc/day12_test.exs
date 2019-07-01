defmodule StringCalc.Day12Test do
  use ExUnit.Case, async: true

  alias StringCalc.Day12, as: StringCalc

  test "compute single number", do:
    assert StringCalc.compute("5.0") == 5

  test "compute addition", do:
    assert StringCalc.compute("4.0+3.0") == 4 + 3

  test "compute subtraction", do:
    assert StringCalc.compute("5.0-1.0") == 5 - 1

  test "compute multiplication", do:
    assert StringCalc.compute("4.0×3.0") == 4 * 3

  test "compute division", do:
    assert StringCalc.compute("12.0÷3.0") == 12 / 3

  test "compute multiple operations" do
    assert StringCalc.compute("4.0+7.0×2.0-20.0÷4.0") == 4 + 7 * 2 - 20 / 4
  end
end
