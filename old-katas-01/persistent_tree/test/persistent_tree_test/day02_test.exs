defmodule PersistentTreeTest.Day02 do
  use ExUnit.Case

  import PersistentTree.Day02
  import Enum

  alias PersistentTree.Day02.Leaf, as: Leaf
  alias PersistentTree.Day02.Node, as: Node

  defp leaf(), do: %Leaf{}
  defp to_tree_node(val, left \\ leaf(), right \\ leaf()), do: %Node{item: val, left: left, right: right}
  defp to_tree(list),
       do: new()
           |> to_tree(list)
  defp to_tree(tree, []), do: tree
  defp to_tree(tree, [head | tail]) do
    tree
    |> add(head)
    |> to_tree(tail)
  end

  test "create empty tree", do:
    assert new() == %Leaf{}

  test "insert item to a list", do:
    assert new()
           |> add(10) == 10
                         |> to_tree_node()

  test "insert item to a left tree", do:
    assert new()
           |> add(20)
           |> add(10) == 20
                         |> to_tree_node(to_tree_node(10))

  test "insert item to a right tree", do:
    assert new()
           |> add(20)
           |> add(30) == 20
                         |> to_tree_node(leaf(), to_tree_node(30))

  test "full two levels tree", do:
    assert new()
           |> add(20)
           |> add(10)
           |> add(30) == 20
                         |> to_tree_node(to_tree_node(10), to_tree_node(30))

  test "insert many items to a left tree", do:
    assert new()
           |> add(20)
           |> add(15)
           |> add(10) == 20
                         |> to_tree_node(to_tree_node(15, to_tree_node(10)))

  test "insert many items to a right tree", do:
    assert new()
           |> add(20)
           |> add(25)
           |> add(30) == 20
                         |> to_tree_node(leaf(), to_tree_node(25, leaf(), to_tree_node(30)))

  test "same value is not added to a tree", do:
    assert new()
           |> add(20)
           |> add(20) == 20
                         |> to_tree_node()

  test "preorder traversal", do:
    assert [5, 2, 1, 4, 7, 6, 8]
           |> to_tree
           |> preorder()
           |> to_list() == [5, 2, 1, 4, 7, 6, 8]

  test "postorder traversal", do:
    assert [5, 2, 1, 4, 7, 6, 8]
           |> to_tree
           |> postorder()
           |> to_list() == [1, 4, 2, 6, 8, 7, 5]

  test "in order traversal", do:
    assert [5, 2, 1, 4, 7, 6, 8]
           |> to_tree
           |> in_order()
           |> to_list() == [1, 2, 4, 5, 6, 7, 8]
end
