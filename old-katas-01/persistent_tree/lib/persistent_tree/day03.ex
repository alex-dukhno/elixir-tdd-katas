defmodule PersistentTree.Day03.Leaf do
  defstruct []
end

defmodule PersistentTree.Day03.Node do
  defstruct [:item, :left, :right]
end

defmodule PersistentTree.Day03 do
  alias PersistentTree.Day03.Leaf
  alias PersistentTree.Day03.Node

  @empty %Leaf{}

  def new(), do: @empty

  def add(%Leaf{}, val), do: %Node{item: val, left: @empty, right: @empty}
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
  def preorder(%Node{item: item, left: left, right: right}) do
    [item]
    |> Stream.concat(
         left
         |> preorder()
       )
    |> Stream.concat(
         right
         |> preorder()
       )
  end

  def postorder(%Leaf{}), do: []
  def postorder(%Node{item: item, left: left, right: right}) do
    left
    |> postorder()
    |> Stream.concat(
         right
         |> postorder()
       )
    |> Stream.concat([item])
  end

  def in_order(%Leaf{}), do: []
  def in_order(%Node{item: item, left: left, right: right}) do
    left
    |> in_order()
    |> Stream.concat([item])
    |> Stream.concat(
         right
         |> in_order()
       )
  end
end
