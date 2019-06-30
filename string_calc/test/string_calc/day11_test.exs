defmodule StringCalc.Day11Test do
  use ExUnit.Case, async: true

  alias StringCalc.Day11, as: StringCalc

  test "compute single number", do:
    assert StringCalc.compute("4.0") == 4

  test "compute addition", do:
    assert StringCalc.compute("3.0+5.0") == 3 + 5

  test "compute subtraction", do:
    assert StringCalc.compute("7.0-2.0") == 7 - 2

  test "compute multiplication", do:
    assert StringCalc.compute("8.0×3.0") == 8 * 3

  test "compute division", do:
    assert StringCalc.compute("15.0÷3.0") == 15 / 3

  test "compute multiple operation", do:
    assert StringCalc.compute("4.0+7.0×2.0-20.0÷4.0") == 4 + 7 * 2 - 20 / 4
end
