defmodule PersistentListTest.Day03 do
  use ExUnit.Case

  import PersistentList.Day03

  defp empty(), do: new()
  defp from_to(from, to),
       do: empty()
           |> from_to(from, to)

  defp from_to(list, from, to) when from == to + 1, do: list
  defp from_to(list, from, to), do:
    list
    |> append(from)
    |> from_to(from + 1, to)

  test "create an empty list", do:
    assert empty()
           |> to_string == "[]"

  test "append an item to a list", do:
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

  test "concatenate empty and nonempty list", do:
    assert empty()
           |> concat(from_to(1, 3))
           |> to_string == "[3, 2, 1]"

  test "concatenate two nonempty lists", do:
    assert from_to(4, 6)
           |> concat(from_to(1, 3))
           |> to_string == "[6, 5, 4, 3, 2, 1]"

  test "drop an item from an empty list", do:
    assert empty()
           |> drop(1)
           |> to_string == "[]"

  test "drop an item from a nonempty list", do:
    assert from_to(1, 3)
           |> drop(1)
           |> to_string == "[2, 1]"

  test "drop items from a nonempty list", do:
    assert from_to(1, 3)
           |> drop(2)
           |> to_string == "[1]"

  test "drop items from an empty list by predicate", do:
    assert empty()
           |> drop_while(fn e -> e == 0 end)
           |> to_string == "[]"

  test "drop items from a nonempty list by predicate" do
    assert from_to(1, 6)
           |> drop_while(fn e -> e > 3 end)
           |> to_string == "[3, 2, 1]"
  end

  test "take items from an empty list", do:
    assert empty()
           |> take(3)
           |> to_string == "[]"

  test "take an item from nonempty list", do:
    assert from_to(1, 3)
           |> take(1)
           |> to_string == "[3]"

  test "take many items from a nonempty list", do:
    assert from_to(1, 6)
           |> take(3)
           |> to_string == "[6, 5, 4]"

  test "take items from an empty list by a predicate", do:
    assert empty()
           |> take_while(fn e -> e > 3 end)
           |> to_string == "[]"

  test "take items from a nonempty list by a predicate", do:
    assert from_to(1, 6)
           |> take_while(fn e -> e > 3 end)
           |> to_string == "[6, 5, 4]"

  test "filter items from an empty list", do:
    assert empty()
           |> filter(fn e -> rem(e, 2) == 0 end)
           |> to_string == "[]"

  test "filter items from a nonempty list" do
    assert from_to(1, 6) |> filter(fn e -> rem(e, 2) == 0 end) |> to_string == "[5, 3, 1]"
  end
end
