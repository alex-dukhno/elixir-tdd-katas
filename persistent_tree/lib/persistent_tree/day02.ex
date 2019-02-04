defmodule PersistentTree.Day02.Leaf do
  defstruct []
end

defmodule PersistentTree.Day02.Node do
  defstruct [:item, :left, :right]
end

defmodule PersistentTree.Day02 do
  alias PersistentTree.Day02.Leaf, as: Leaf
  alias PersistentTree.Day02.Node, as: Node

  import Stream, only: [concat: 2]

  @leaf %Leaf{}

  def new(), do: @leaf

  defp node_with(item), do: %Node{item: item, left: @leaf, right: @leaf}
  defp node_with(item, left, right), do: %Node{item: item, left: left, right: right}

  def add(%Leaf{}, val), do: node_with(val)
  def add(%Node{item: item} = node, val) when item == val, do: node
  def add(%Node{item: item, left: left, right: right}, val) when item > val, do:
    node_with(item, add(left, val), right)
  def add(%Node{item: item, left: left, right: right}, val) when item < val, do:
    node_with(item, left, add(right, val))

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
    |> concat([item])
    |> concat(in_order(right))
end
