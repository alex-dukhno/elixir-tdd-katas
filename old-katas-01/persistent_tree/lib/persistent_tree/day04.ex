defmodule PersistentTree.Day04.Leaf do
  defstruct []
end

defmodule PersistentTree.Day04.Node do
  defstruct [:item, :left, :right]
end

defmodule PersistentTree.Day04 do
  import Stream

  alias PersistentTree.Day04.Leaf
  alias PersistentTree.Day04.Node

  def new(), do: %Leaf{}

  def add(%Leaf{}, val), do: %Node{item: val, left: %Leaf{}, right: %Leaf{}}
  def add(%Node{item: item} = node, val) when item == val, do: node
  def add(%Node{item: item, left: left, right: right}, val) when item > val,
      do: %Node{
        item: item,
        left: left
              |> add(val),
        right: right
      }
  def add(%Node{item: item, left: left, right: right}, val) when item < val,
      do: %Node{
        item: item,
        left: left,
        right: right
               |> add(val)
      }

  def preorder(%Leaf{}), do: []
  def preorder(%Node{item: item, left: left, right: right}), do:
    [item]
    |> concat(preorder(left))
    |> concat(preorder(right))

  def postorder(%Leaf{}), do: []
  def postorder(%Node{item: item, left: left, right: right}), do:
    postorder(left)
    |> concat(postorder(right))
    |> concat([item])

  def in_order(%Leaf{}), do: []
  def in_order(%Node{item: item, left: left, right: right}), do:
    in_order(left)
    |> Stream.concat([item])
    |> Stream.concat(in_order(right))
end
