defmodule StringCompression.Day04 do
  def compress(src),
      do: src
          |> String.graphemes()
          |> count()
          |> Enum.map(fn {counter, char} -> "#{counter}#{char}" end)
          |> Enum.join()

  defp count([]), do: []
  defp count([char | rest]), do: count(char, rest)

  defp count(char, list, counter \\ 1)
  defp count(char, [], counter), do: [{counter, char}]
  defp count(char, [next | rest], counter) when char == next, do: count(char, rest, counter + 1)
  defp count(char, [next | rest], counter), do: [{counter, char} | count(next, rest)]
end
