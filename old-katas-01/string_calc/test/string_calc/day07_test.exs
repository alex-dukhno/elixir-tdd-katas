defmodule StringCalc.Day07Test do
  use ExUnit.Case, async: true

  alias StringCalc.Day07, as: StringCalc

  test "compute single number", do:
    assert StringCalc.compute("4.0")

  test "compute addition", do:
    assert StringCalc.compute("5.0+2.0") == 5 + 2

  test "compute subtraction", do:
    assert StringCalc.compute("10.0-3.0") == 10 - 3

  test "compute multiplication", do:
    assert StringCalc.compute("5.0×3.0") == 5 * 3

  test "compute division", do:
    assert StringCalc.compute("40.0÷8.0") == 40 / 8

  test "compute many operations", do:
    assert StringCalc.compute("4.0+3.0×8.0-24.0÷4.0") == 4 + 3 * 8 - 24 / 4
end
