defmodule PersistentTreeTest.Day03 do
  use ExUnit.Case

  import Enum

  alias PersistentTree.Day03.Leaf
  alias PersistentTree.Day03.Node

  import PersistentTree.Day03

  defp empty(), do: %Leaf{}

  defp to_node(val, children \\ []) do
    defaults = [left: empty(), right: empty()]
    %{left: left, right: right} = Keyword.merge(defaults, children)
                                  |> Enum.into(%{})
    %Node{item: val, left: left, right: right}
  end

  defp to_tree(list),
       do: empty()
           |> to_tree(list)
  defp to_tree(tree, []), do: tree
  defp to_tree(tree, [head | tail]),
       do: tree
           |> add(head)
           |> to_tree(tail)

  test "create empty tree", do:
    assert new() == empty()

  test "add item to a tree", do:
    assert new()
           |> add(20) == 20
                         |> to_node()

  test "add item to a left tree", do:
    assert new()
           |> add(20)
           |> add(10) == 20
                         |> to_node([left: to_node(10)])

  test "add item to a right tree", do:
    assert new()
           |> add(20)
           |> add(30) == 20
                         |> to_node([right: to_node(30)])

  test "full two levels tree", do:
    assert new()
           |> add(20)
           |> add(30)
           |> add(10) == 20
                         |> to_node([left: to_node(10), right: to_node(30)])


  test "add many to a left tree", do:
    assert new()
           |> add(20)
           |> add(15)
           |> add(10) == 20
                         |> to_node(
                              [
                                left: 15
                                      |> to_node(
                                           [
                                             left: 10
                                                   |> to_node()
                                           ]
                                         )
                              ]
                            )

  test "add many to a right tree", do:
    assert new()
           |> add(20)
           |> add(25)
           |> add(30) == 20
                         |> to_node(
                              [
                                right: 25
                                       |> to_node(
                                            [
                                              right: 30
                                                     |> to_node()
                                            ]
                                          )
                              ]
                            )

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
