defmodule StringCompression.Day08 do
  def compress(str), do:
    str
    |> String.graphemes()
    |> count_unique()
    |> Enum.map(fn {counter, char} -> "#{counter}#{char}" end)
    |> Enum.join()

  defp count_unique([]), do: []
  defp count_unique([char | rest]), do: count(char, rest)

  defp count(char, string, counter \\ 1)
  defp count(char, [], counter), do: [{counter, char}]
  defp count(char, [next | rest], counter) when char == next, do: count(char, rest, counter + 1)
  defp count(char, [next | rest], counter), do: [{counter, char} | count(next, rest)]
end
