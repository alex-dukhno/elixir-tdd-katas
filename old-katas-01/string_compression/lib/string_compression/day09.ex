defmodule StringCompression.Day09 do
  def compress(string), do:
    string
    |> String.graphemes()
    |> count_unique_chars()
    |> Enum.map(fn {counter, char} -> "#{counter}#{char}" end)
    |> Enum.join()

  defp count_unique_chars([]), do: []
  defp count_unique_chars([char | rest]), do: count_chars(char, rest)

  defp count_chars(current, chars, counter \\ 1)
  defp count_chars(current, [], counter), do: [{counter, current}]
  defp count_chars(current, [next | rest], counter) when current == next,
       do: count_chars(current, rest, counter + 1)
  defp count_chars(current, [next | rest], counter),
       do: [{counter, current} | count_chars(next, rest)]
end
