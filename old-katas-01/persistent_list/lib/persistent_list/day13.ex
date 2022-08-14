defmodule PersistentList.Day13 do
  alias PersistentList.Day13, as: List

  defstruct [:head, :tail]

  defimpl String.Chars, for: List do
    def to_string(list), do: "[" <> stringify(list) <> "]"

    defp stringify(%List{head: nil, tail: nil}), do: ""
    defp stringify(
           %List{
             head: head,
             tail: %List{
               head: nil,
               tail: nil
             }
           }
         ), do: "#{head}"
    defp stringify(%List{head: head, tail: tail}), do: "#{head}, " <> stringify(tail)
  end

  def new(), do: %List{}

  def append(list, item), do: %List{head: item, tail: list}

  def prepend(%List{head: nil, tail: nil} = empty, item),
      do: empty
          |> append(item)
  def prepend(%List{head: head, tail: tail}, item),
      do: tail
          |> prepend(item)
          |> append(head)

  def concat(%List{head: nil, tail: nil}, other), do: other
  def concat(%List{head: head, tail: tail}, other),
      do: tail
          |> concat(other)
          |> append(head)

  def drop(%List{head: nil, tail: nil} = empty, _num), do: empty
  def drop(list, 0), do: list
  def drop(%List{tail: tail}, num),
      do: tail
          |> drop(num - 1)

  def drop_while(%List{head: nil, tail: nil} = empty, _predicate), do: empty
  def drop_while(%List{head: head, tail: tail} = list, predicate), do:
    if predicate.(head),
    do:
      tail
      |> drop_while(predicate),
    else:
      list

  def take(%List{head: nil, tail: nil} = empty, _num), do: empty
  def take(_list, 0), do: %List{}
  def take(%List{head: head, tail: tail}, num),
      do: tail
          |> take(num - 1)
          |> append(head)

  def take_while(%List{head: nil, tail: nil} = empty, _predicate), do: empty
  def take_while(%List{head: head, tail: tail}, predicate), do:
    if predicate.(head),
    do:
      tail
      |> take_while(predicate)
      |> append(head),
    else:
    %List{}

  def filter(%List{head: nil, tail: nil} = empty, _predicate), do: empty
  def filter(%List{head: head, tail: tail}, predicate), do:
    unless predicate.(head),
    do:
      tail
      |> filter(predicate)
      |> append(head),
    else:
      tail
      |> filter(predicate)
end
