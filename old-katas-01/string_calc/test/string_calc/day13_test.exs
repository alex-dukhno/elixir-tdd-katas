defmodule StringCalc.Day13Test do
  use ExUnit.Case, async: true

  alias StringCalc.Day13, as: StringCalc

  test "compute single number", do:
    assert StringCalc.compute("4.0") == 4

  test "compute addition", do:
    assert StringCalc.compute("5.0+3.0") == 5 + 3

  test "compute subtraction", do:
    assert StringCalc.compute("4.0-1.0") == 4 - 1

  test "compute multiplication", do:
    assert StringCalc.compute("3.0×4.0") == 3 * 4

  test "compute division", do:
    assert StringCalc.compute("20.0÷4.0") == 20 / 4

  test "compute multiple operations", do:
    assert StringCalc.compute("4.0+7.0×2.0-20.0÷4.0") == 4 + 7 * 2 - 20 / 4
end
