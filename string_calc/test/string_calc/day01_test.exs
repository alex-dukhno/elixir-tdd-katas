defmodule StringCalc.Day01Test do
  use ExUnit.Case, async: true

  alias StringCalc.Day01, as: StringCalc

  test "compute negative number", do:
    assert StringCalc.compute("-1.0") == -1

  test "compute addition", do:
    assert StringCalc.compute("2.0+3.0") == 2 + 3

  test "compute subtraction" do
    assert StringCalc.compute("4.0-1.0") == 4 - 1
  end
end
