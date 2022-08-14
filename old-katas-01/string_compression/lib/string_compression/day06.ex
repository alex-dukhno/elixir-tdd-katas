defmodule StringCompression.Day06 do
  def compress(src), do:
    src
    |> String.graphemes()
    |> count_duplicate()
    |> Enum.map(fn {counter, char} -> "#{counter}#{char}" end)
    |> Enum.join()

  defp count_duplicate([]), do: []
  defp count_duplicate([first | rest]), do: count(first, rest)

  defp count(current, chars, counter \\ 1)
  defp count(current, [], counter), do: [{counter, current}]
  defp count(current, [next | rest], counter) when current == next,
       do: count(current, rest, counter + 1)
  defp count(current, [next | rest], counter), do: [{counter, current} | count(next, rest)]
end
