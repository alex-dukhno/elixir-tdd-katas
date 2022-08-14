defprotocol PersistentTree.Day05.Tree do
  def add(tree, val)
  def preorder(tree)
  def postorder(tree)
  def in_order(tree)
end

defmodule PersistentTree.Day05.Leaf, do: defstruct []
defmodule PersistentTree.Day05.Node, do: defstruct [:item, :left, :right]

defimpl PersistentTree.Day05.Tree, for: PersistentTree.Day05.Node do
  alias PersistentTree.Day05.Node
  alias PersistentTree.Day05.Leaf
  alias PersistentTree.Day05.Tree

  def add(%Node{item: item, left: left, right: right}, val) when item > val, do:
  %Node{
    item: item,
    left: left
          |> Tree.add(val),
    right: right
  }
  def add(%Node{item: item, left: left, right: right}, val), do:
  %Node{
    item: item,
    left: left,
    right: right
           |> Tree.add(val)
  }

  def preorder(%Node{item: item, left: left, right: right}), do:
    [item]
    |> Stream.concat(Tree.preorder(left))
    |> Stream.concat(Tree.preorder(right))

  def postorder(%Node{item: item, left: left, right: right}), do:
    Tree.postorder(left)
    |> Stream.concat(Tree.postorder(right))
    |> Stream.concat([item])

  def in_order(%Node{item: item, left: left, right: right}), do:
    Tree.in_order(left)
    |> Stream.concat([item])
    |> Stream.concat(Tree.in_order(right))
end

defimpl PersistentTree.Day05.Tree, for: PersistentTree.Day05.Leaf do
  alias PersistentTree.Day05.Node
  alias PersistentTree.Day05.Leaf

  def add(_tree, val), do: %Node{item: val, left: %Leaf{}, right: %Leaf{}}
  def preorder(_tree), do: []
  def postorder(_tree), do: []
  def in_order(_tree), do: []
end

defmodule PersistentTree.Day05 do
  alias PersistentTree.Day05.Leaf
  alias PersistentTree.Day05.Tree

  def new(), do: %Leaf{}

  def add(tree, val), do:
    tree
    |> Tree.add(val)

  def preorder(tree), do:
    tree
    |> Tree.preorder()

  def postorder(tree), do:
    tree
    |> Tree.postorder()

  def in_order(tree), do:
    tree
    |> Tree.in_order()
end
