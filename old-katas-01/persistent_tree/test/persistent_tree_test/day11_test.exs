defmodule PersistentTreeTest.Day11 do
  use ExUnit.Case

  alias PersistentTree.Day11, as: Tree
  alias PersistentTree.Day11.{Leaf, Node}

  defp empty(), do: %Leaf{}

  defp bottom_node(val), do: %Node{item: val, left: empty(), right: empty()}

  defp node_with_left(val, []),
       do: bottom_node(val)
  defp node_with_left(val, [left | rest]),
       do: %Node{item: val, left: node_with_left(left, rest), right: empty()}

  defp node_with_right(val, []),
       do: bottom_node(val)
  defp node_with_right(val, [right | rest]),
       do: %Node{item: val, left: empty(), right: node_with_right(right, rest)}

  defp into_tree(list),
       do: empty()
           |> into_tree(list)
  defp into_tree(tree, []), do: tree
  defp into_tree(tree, [head | tail]),
       do: tree
           |> Tree.add(head)
           |> into_tree(tail)

  test "create empty tree", do:
    assert Tree.new() == empty()

  test "add item to a tree", do:
    assert Tree.new()
           |> Tree.add(20) == bottom_node(20)

  test "add item to a left tree", do:
    assert Tree.new()
           |> Tree.add(20)
           |> Tree.add(10) == node_with_left(20, [10])

  test "add item to a right tree", do:
    assert Tree.new()
           |> Tree.add(20)
           |> Tree.add(30) == node_with_right(20, [30])

  test "add items to a left tree", do:
    assert Tree.new()
           |> Tree.add(20)
           |> Tree.add(15)
           |> Tree.add(10) == node_with_left(20, [15, 10])

  test "add items to a right tree", do:
    assert Tree.new()
           |> Tree.add(20)
           |> Tree.add(25)
           |> Tree.add(30) == node_with_right(20, [25, 30])

  test "preorder traversal", do:
    assert [5, 2, 1, 4, 7, 6, 8]
           |> into_tree()
           |> Tree.preorder()
           |> Enum.to_list() == [5, 2, 1, 4, 7, 6, 8]

  test "postorder traversal", do:
    assert [5, 2, 1, 4, 7, 6, 8]
           |> into_tree()
           |> Tree.postorder()
           |> Enum.to_list() == [1, 4, 2, 6, 8, 7, 5]

  test "in order traversal", do:
    assert [5, 2, 1, 4, 7, 6, 8]
           |> into_tree()
           |> Tree.in_order()
           |> Enum.to_list() == [1, 2, 4, 5, 6, 7, 8]
end
