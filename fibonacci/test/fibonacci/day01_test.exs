defmodule Fibonacci.Day01Test do
  use ExUnit.Case, async: true

  alias Fibonacci.Day01, as: Fibonacci

  setup do: {:ok, fib: Fibonacci.create()}

  test "first number is zero", %{fib: fib}, do:
    assert Fibonacci.get(fib, 1) == 1

  test "third number is two", %{fib: fib}, do:
    assert Fibonacci.get(fib, 3) == 2

  test "fifth number is five", %{fib: fib}, do:
    assert Fibonacci.get(fib, 5) == 5
end
