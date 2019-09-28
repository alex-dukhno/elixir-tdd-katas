defmodule StringCompression.Day05 do
  def compress(src), do:
    src
    |> String.graphemes()
    |> count()
    |> Enum.map(fn {count, char} -> "#{count}#{char}" end)
    |> Enum.join()

  defp count([]), do: []
  defp count([c | rest]), do: count(c, rest)

  defp count(current, string, count \\ 1)
  defp count(current, [], count), do: [{count, current}]
  defp count(current, [next | rest], count) when current == next, do: count(current, rest, count + 1)
  defp count(current, [next | rest], count), do: [{count, current} | count(next, rest)]
end
