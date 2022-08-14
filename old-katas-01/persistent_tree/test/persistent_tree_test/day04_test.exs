defmodule PersistentTreeTest.Day04 do
  use ExUnit.Case

  alias PersistentTree.Day04, as: Tree
  alias PersistentTree.Day04.Leaf
  alias PersistentTree.Day04.Node

  defp empty(), do: %Leaf{}

  defp into_tree(list), do:
    empty()
    |> into_tree(list)

  defp into_tree(tree, []), do: tree
  defp into_tree(tree, [head | tail]), do:
    tree
    |> Tree.add(head)
    |> into_tree(tail)

  defp to_node(val, children \\ []) do
    defaults = [left: empty(), right: empty()]
    %{left: left, right: right} = defaults
                                  |> Keyword.merge(children)
                                  |> Enum.into(%{})
    %Node{item: val, left: left, right: right}
  end

  test "create empty tree", do:
    assert Tree.new() == %Leaf{}

  test "add item to a tree", do:
    assert Tree.new()
           |> Tree.add(20) == 20
                              |> to_node()

  test "add item to a left tree", do:
    assert Tree.new()
           |> Tree.add(20)
           |> Tree.add(10) == [20, 10]
                              |> into_tree()

  test "add item to a right tree", do:
    assert Tree.new()
           |> Tree.add(20)
           |> Tree.add(30) == [20, 30]
                              |> into_tree()

  test "add items to a left tree", do:
    assert Tree.new()
           |> Tree.add(20)
           |> Tree.add(15)
           |> Tree.add(10) == [20, 15, 10]
                              |> into_tree()

  test "add items to a right tree", do:
    assert Tree.new()
           |> Tree.add(20)
           |> Tree.add(25)
           |> Tree.add(30) == [20, 25, 30]
                              |> into_tree()

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
