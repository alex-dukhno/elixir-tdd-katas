defmodule StringCompression.Day07 do
  def compress(src), do:
    src
    |> String.graphemes()
    |> count_unique()
    |> Enum.map(fn {counter, char} -> "#{counter}#{char}" end)
    |> Enum.join()

  defp count_unique([]), do: []
  defp count_unique([first | rest]) do
    count(first, rest)
  end

  defp count(current, chars, counter \\ 1)
  defp count(current, [], counter), do: [{counter, current}]
  defp count(current, [next | rest], counter) when current == next,
       do: count(current, rest, counter + 1)
  defp count(current, [next | rest], counter), do: [{counter, current} | count(next, rest)]
end
