defmodule StringCalc.Day08Test do
  use ExUnit.Case, async: true

  alias StringCalc.Day08, as: StringCalc

  test "compute single number", do:
    assert StringCalc.compute("4.0") == 4

  test "compute addition", do:
    assert StringCalc.compute("5.0+3.0") == 5 + 3

  test "compute subtraction", do:
    assert StringCalc.compute("7.0-2.0") == 7 - 2

  test "compute multiplication", do:
    assert StringCalc.compute("4.0×8.0") == 4 * 8

  test "compute division", do:
    assert StringCalc.compute("40.0÷4.0") == 40 / 4

  test "compute many operations" do
    assert StringCalc.compute("4.0+7.0×2.0-20.0÷4.0") == 4 + 7 * 2 - 20 / 4
  end
end
