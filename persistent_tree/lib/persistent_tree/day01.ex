defmodule PersistentTree.Day01.Node do
  defstruct [:item, :left, :right]
end

defmodule PersistentTree.Day01.Leaf do
  defstruct []
end

defmodule PersistentTree.Day01 do

  alias PersistentTree.Day01.Node, as: Node
  alias PersistentTree.Day01.Leaf, as: Leaf

  @leaf %Leaf{}

  def new(), do: @leaf

  def add(%Leaf{}, val), do: %Node{item: val, left: @leaf, right: @leaf}
  def add(%Node{item: item, left: left, right: right} = tree, val) do
    cond do
      val == item -> tree
      val < item -> %Node{item: item, left: left |> add(val), right: right}
      val > item -> %Node{item: item, left: left, right: right |> add(val)}
    end
  end
end
