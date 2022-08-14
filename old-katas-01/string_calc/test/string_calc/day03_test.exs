defmodule StringCalc.Day03Test do
  use ExUnit.Case, async: true

  alias StringCalc.Day03, as: StringCalc

  test "compute single number", do:
    assert StringCalc.compute("5.0") == 5

  test "compute addition", do:
    assert StringCalc.compute("4.0+5.0") == 4 + 5

  test "compute subtraction", do:
    assert StringCalc.compute("3.0-1.0") == 3 - 1

  test "compute multiplication", do:
    assert StringCalc.compute("5.0×3.0") == 5 * 3

  test "compute division", do:
    assert StringCalc.compute("21.0÷3.0") == 21 / 3

  @tag :skip
  test "compute multiple operations" do
    assert StringCalc.compute("5.0+3.0×4.0-15.0÷3.0") == 5 + 3 * 4 - 15 / 3
  end
end
