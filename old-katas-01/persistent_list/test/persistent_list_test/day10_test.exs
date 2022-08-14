defmodule PersistentListTest.Day10 do
  use ExUnit.Case

  import PersistentList.Day10

  defp empty(), do: new()
  defp from_to(from, to),
       do: empty()
           |> from_to(from, to)
  defp from_to(list, from, to) when from == to + 1, do: list
  defp from_to(list, from, to),
       do: list
           |> append(from)
           |> from_to(from + 1, to)

  test "create empty list", do:
    assert empty()
           |> to_string == "[]"

  test "append item to a list", do:
    assert empty()
           |> append(1)
           |> to_string == "[1]"

  test "append many items to a list", do:
    assert empty()
           |> append(1)
           |> append(2)
           |> append(3)
           |> to_string == "[3, 2, 1]"

  test "prepend item to a list", do:
    assert empty()
           |> prepend(1)
           |> to_string == "[1]"

  test "prepend items to a list", do:
    assert empty()
           |> prepend(1)
           |> prepend(2)
           |> prepend(3)
           |> to_string == "[1, 2, 3]"

  test "concatenate two empty lists", do:
    assert empty()
           |> concat(empty())
           |> to_string == "[]"

  test "concatenate empty and nonempty lists", do:
    assert empty()
           |> concat(from_to(1, 3))
           |> to_string == "[3, 2, 1]"

  test "concatenate two nonempty lists", do:
    assert from_to(4, 6)
           |> concat(from_to(1, 3))
           |> to_string == "[6, 5, 4, 3, 2, 1]"

  test "drop items from empty list", do:
    assert empty()
           |> drop(3)
           |> to_string == "[]"

  test "drop items from nonempty list", do:
    assert from_to(1, 6)
           |> drop(3)
           |> to_string == "[3, 2, 1]"

  test "drop items from empty list by predicate", do:
    assert empty()
           |> drop_while(fn e -> e == 0 end)
           |> to_string == "[]"

  test "drop items from nonempty list by predicate", do:
    assert from_to(1, 6)
           |> drop_while(fn e -> e > 3 end)
           |> to_string == "[3, 2, 1]"

  test "take items from empty list", do:
    assert empty()
           |> take(3)
           |> to_string == "[]"

  test "take items from nonempty list", do:
    assert from_to(1, 6)
           |> take(3)
           |> to_string == "[6, 5, 4]"

  test "take items from empty list by predicate", do:
    assert empty()
           |> take_while(fn e -> e == 0 end)
           |> to_string == "[]"

  test "take items from nonempty list by predicate", do:
    assert from_to(1, 6)
           |> take_while(fn e -> e > 3 end)
           |> to_string == "[6, 5, 4]"

  test "filter items from empty list", do:
    assert empty()
           |> filter(fn e -> e == 0 end)
           |> to_string == "[]"

  test "filter items from nonempty list", do:
    assert from_to(1, 6)
           |> filter(fn e -> rem(e, 2) == 0 end)
           |> to_string == "[5, 3, 1]"
end
