defmodule Fibonacci.Day08Test do
  use ExUnit.Case, async: true

  alias Fibonacci.Day08, as: Fibonacci

  setup do: Fibonacci.start_link()

  test "first number is 1", do:
    assert Fibonacci.get(1) == 1

  test "second number is 1", do:
    assert Fibonacci.get(2) == 1

  test "third number is 2", do:
    assert Fibonacci.get(3) == 2
end
