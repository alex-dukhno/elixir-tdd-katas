defmodule StringCalc.Day05Test do
  use ExUnit.Case, async: true

  test "compute single number", do:
    assert StringCalc.Day05.compute("4.0") == 4

  test "compute addition", do:
    assert StringCalc.Day05.compute("5.0+2.0") == 5 + 2

  test "compute subtraction", do:
    assert StringCalc.Day05.compute("9.0-3.0") == 9 - 3

  test "compute multiplication", do:
    assert StringCalc.Day05.compute("5.0×9.0") == 5 * 9

  test "compute division", do:
    assert StringCalc.Day05.compute("36.0÷6.0") == 36 / 6

  test "compute many operations", do:
    assert StringCalc.Day05.compute("4.0+3.0×8.0-24.0÷4.0") == 4 + 3 * 8 - 24 / 4
end
