defmodule StringCalc.Day06Test do
  use ExUnit.Case, async: true

  alias StringCalc.Day06, as: StringCalc

  test "compute single number", do:
    assert StringCalc.compute("5.0") == 5

  test "compute addition", do:
    assert StringCalc.compute("4.0+2.0") == 4 + 2

  test "compute subtraction", do:
    assert StringCalc.compute("6.0-1.0") == 6 - 1

  test "compute multiplication", do:
    assert StringCalc.compute("4.0×3.0") == 4 * 3

  test "compute division", do:
    assert StringCalc.compute("36.0÷6.0") == 36 / 6

  test "compute many operations", do:
    assert StringCalc.compute("4.0+3.0×8.0-24.0÷4.0") == 4 + 3 * 8 - 24 / 4
end
