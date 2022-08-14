defmodule PersistentListTest.Day01 do
  use ExUnit.Case

  import PersistentList.Day01
  #  alias PersistentList.Day01, as: List

  defp empty(), do: new()
  defp list_from_to(from, to), do: list_from_to(from, to, empty())
  defp list_from_to(from, to, list) when from == to + 1, do: list
  defp list_from_to(from, to, list),
       do: list_from_to(from + 1, to, append(list, from))


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

  test "prepend items to list", do:
    assert empty()
           |> prepend(1)
           |> prepend(2)
           |> to_string == "[1, 2]"

  test "concatenate two empty lists", do:
    assert empty()
           |> concat(empty())
           |> to_string == "[]"

  test "concatenate empty list with nonempty list", do:
    assert empty()
           |> concat(list_from_to(1, 3))
           |> to_string == "[3, 2, 1]"

  test "concatenate nonempty list with empty list", do:
    assert list_from_to(4, 6)
           |> concat(empty())
           |> to_string == "[6, 5, 4]"

  test "concatenate two nonempty lists", do:
    assert list_from_to(4, 6)
           |> concat(list_from_to(1, 3))
           |> to_string == "[6, 5, 4, 3, 2, 1]"

  test "drop item from an empty list", do:
    assert empty()
           |> drop(1)
           |> to_string == "[]"

  test "drop first three items from a list", do:
    assert list_from_to(1, 4)
           |> drop(3)
           |> to_string == "[1]"

  test "drop by predicate from an empty list", do:
    assert empty()
           |> drop_while(fn e -> e == 0 end)
           |> to_string == "[]"

  test "drop by predicate from nonempty list", do:
    assert list_from_to(1, 5)
           |> drop_while(fn e -> rem(e, 2) == 0 end)
           |> to_string == "[5, 3, 1]"

  test "take three items from empty list", do:
    assert empty()
           |> take(3)
           |> to_string == "[]"

  test "take three items from 5 items list", do:
    assert list_from_to(1, 5) |> take(3) |> to_string == "[5, 4, 3]"

  test "take items by predicate from an empty list", do:
    assert empty() |> take_while(fn e -> e == 0 end) |> to_string == "[]"

  test "take items by predicate from a nonempty list" do
    assert list_from_to(1, 6) |> take_while(fn e -> e > 3 end) |> to_string == "[6, 5, 4]"
  end
end
