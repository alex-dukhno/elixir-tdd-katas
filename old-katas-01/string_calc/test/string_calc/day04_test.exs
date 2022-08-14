defmodule StringCalc.Day04Test do
  use ExUnit.Case, async: true

  alias StringCalc.Day04, as: StringCalc

  test "compute single number", do:
    assert StringCalc.compute("4.0") == 4

  test "compute addition", do:
    assert StringCalc.compute("4.0+3.0") == 4 + 3

  test "compute subtraction", do:
    assert StringCalc.compute("5.0-2.0") == 5 - 2

  test "compute multiplication", do:
    assert StringCalc.compute("3.0×9.0") == 3 * 9

  test "compute division", do:
    assert StringCalc.compute("36.0÷4.0") == 36 / 4

  test "compute many operations" do
    IO.puts("\n")
    assert StringCalc.compute("3.0+4.0×2.0-18.0÷3.0") == 3 + 4 * 2 - 18 / 3
  end
end
