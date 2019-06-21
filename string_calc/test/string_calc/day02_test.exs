defmodule StringCalc.Day02Test do
  use ExUnit.Case, async: true

  alias StringCalc.Day02, as: StringCalc

  test "compute single number", do:
    assert StringCalc.compute("1.0") == 1

  test "compute negative number", do:
    assert StringCalc.compute("-3.0") == -3

  test "compute addition", do:
    assert StringCalc.compute("1.0+5.0") == 1 + 5

  test "compute subtraction", do:
    assert StringCalc.compute("4.0-3.0") == 4 - 3

  @tag :skip
  test "compute multiplication", do:
    assert StringCalc.compute("4.0×5.0") == 4 * 5

  @tag :skip
  test "compute division", do:
    assert StringCalc.compute("20.0÷4.0") == 20 / 4

  @tag :skip
  test "compute many operation" do
    assert StringCalc.compute("4.0+3.0*5.0-17.0") == 4 + 3 * 5 - 17
  end
end
