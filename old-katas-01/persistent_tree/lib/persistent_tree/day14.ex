defprotocol PersistentTree.Day14.Tree do
  def add(tree, val)
  def preorder(tree)
  def postorder(tree)
  def in_order(tree)
end

defmodule PersistentTree.Day14.Leaf, do: defstruct []
defmodule PersistentTree.Day14.Node, do: defstruct [:item, :left, :right]

defimpl PersistentTree.Day14.Tree, for: PersistentTree.Day14.Leaf do
  alias PersistentTree.Day14.Node

  def add(empty, val),
      do: %Node{item: val, left: empty, right: empty}

  def preorder(_empty), do: []
  def postorder(_empty), do: []
  def in_order(_empty), do: []
end

defimpl PersistentTree.Day14.Tree, for: PersistentTree.Day14.Node do
  alias PersistentTree.Day14.{Leaf, Node, Tree}

  def add(node = %Node{item: item}, val) when item == val,
      do: node
  def add(%Node{item: item, left: left, right: right}, val) when item > val,
      do: %Node{
        item: item,
        left: Tree.add(left, val),
        right: right
      }
  def add(%Node{item: item, left: left, right: right}, val) when item < val,
      do: %Node{
        item: item,
        left: left,
        right: Tree.add(right, val)
      }

  def preorder(%Node{item: item, left: left, right: right}),
      do: [item]
          |> Stream.concat(Tree.preorder(left))
          |> Stream.concat(Tree.preorder(right))

  def postorder(%Node{item: item, left: left, right: right}),
      do: Tree.postorder(left)
          |> Stream.concat(Tree.postorder(right))
          |> Stream.concat([item])

  def in_order(%Node{item: item, left: left, right: right}),
      do: Tree.in_order(left)
          |> Stream.concat([item])
          |> Stream.concat(Tree.in_order(right))
end

defmodule PersistentTree.Day14 do
  alias PersistentTree.Day14.{Leaf, Tree}

  def new(), do: %Leaf{}

  def add(tree, val),
      do: tree
          |> Tree.add(val)

  def preorder(tree),
      do: tree
          |> Tree.preorder()

  def postorder(tree),
      do: tree
          |> Tree.postorder()

  def in_order(tree),
      do: tree
          |> Tree.in_order()
end
