defmodule PersistentTreeTest.Day01 do
  use ExUnit.Case

  alias PersistentTree.Day01.Node, as: Node
  alias PersistentTree.Day01.Leaf, as: Leaf
  import PersistentTree.Day01

  defp empty(), do: new()

  test "create empty tree", do:
    assert empty() == %Leaf{}

  test "insert one item", do:
    assert empty()
           |> add(10) == %Node{item: 10, left: %Leaf{}, right: %Leaf{}}

  test "insert item to a left tree", do:
    assert empty()
           |> add(20)
           |> add(10) == %Node{
             item: 20,
             left: %Node{
               item: 10,
               left: %Leaf{},
               right: %Leaf{}
             },
             right: %Leaf{}
           }

  test "insert item to a right tree", do:
    assert empty()
           |> add(20)
           |> add(30) == %Node{
             item: 20,
             left: %Leaf{},
             right: %Node{
               item: 30,
               left: %Leaf{},
               right: %Leaf{}
             }
           }

  test "insert many items to a tree", do:
    assert empty()
           |> add(20)
           |> add(30)
           |> add(10)
           |> add(40) == %Node{
             item: 20,
             left: %Node{
               item: 10,
               left: %Leaf{},
               right: %Leaf{}
             },
             right: %Node{
               item: 30,
               left: %Leaf{},
               right: %Node{
                 item: 40,
                 left: %Leaf{},
                 right: %Leaf{}
               }
             }
           }
end
