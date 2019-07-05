defmodule Fibonacci.Day02Test do
  use ExUnit.Case, async: true

  alias Fibonacci.Day02, as: Fibonacci

  setup do
    Fibonacci.create()
    :ok
  end

  test "first number is one", do:
    assert Fibonacci.get(1) == 1

  test "third number is two", do:
    assert Fibonacci.get(3) == 2
end
