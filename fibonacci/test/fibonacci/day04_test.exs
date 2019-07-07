defmodule Fibonacci.Day04Test do
  use ExUnit.Case, async: true

  alias Fibonacci.Day04, as: Fibonacci

  setup do
    Fibonacci.start_link()
    :ok
  end

  test "first number is 1", do:
    assert Fibonacci.get(1) == 1

  test "second number is 1", do:
    assert Fibonacci.get(2) == 1

  test "third number is 2", do:
    assert Fibonacci.get(3) == 2
end
