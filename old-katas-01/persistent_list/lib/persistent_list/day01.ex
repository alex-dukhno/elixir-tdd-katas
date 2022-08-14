defmodule PersistentList.Day01 do
  alias PersistentList.Day01, as: List

  defstruct head: nil, tail: nil

  defimpl String.Chars, for: List do
    def to_string(list), do:
      "[" <> string_from(list) <> "]"

    defp string_from(%List{head: nil, tail: nil}), do: ""
    defp string_from(
           %List{
             head: head,
             tail: %List{
               head: nil,
               tail: nil
             }
           }
         ), do: "#{head}"
    defp string_from(%List{head: head, tail: tail}), do: "#{head}, " <> string_from(tail)
  end

  def new(), do: %List{}

  def append(list, item), do: %List{head: item, tail: list}

  def prepend(%List{head: nil, tail: nil} = list, item), do: %List{head: item, tail: list}
  def prepend(%List{head: head, tail: tail}, item),
      do: tail
          |> prepend(item)
          |> append(head)

  def concat(%List{head: nil, tail: nil}, second), do: second
  def concat(first, %List{head: nil, tail: nil}), do: first
  def concat(%List{head: head, tail: rest}, second),
      do: rest
          |> concat(second)
          |> append(head)

  def drop(%List{head: nil, tail: nil} = empty, _), do: empty
  def drop(list, num) when num == 0, do: list
  def drop(%List{head: _, tail: tail}, num), do: drop(tail, num - 1)

  def drop_while(%List{head: nil, tail: nil} = empty, _), do: empty
  def drop_while(%List{head: head, tail: tail}, predicate) do
    rest = drop_while(tail, predicate)
    unless predicate.(head),
           do: rest
               |> append(head),
           else: rest
  end

  def take(%List{head: nil, tail: nil} = empty, _), do: empty
  def take(_, num) when num == 0, do: %List{}
  def take(%List{head: head, tail: tail}, num), do:
    tail
    |> take(num - 1)
    |> append(head)

  def take_while(%List{head: nil, tail: nil} = empty, _), do: empty
  def take_while(%List{head: head, tail: tail}, predicate), do:
    if predicate.(head),
    do: tail
        |> take_while(predicate)
        |> append(head),
    else: %List{}
end
