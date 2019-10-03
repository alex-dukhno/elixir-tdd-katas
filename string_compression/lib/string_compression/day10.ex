defmodule StringCompression.Day10 do
  def compress(string),
      do: string
          |> String.graphemes()
          |> count_unique_chars()
          |> Enum.map(fn {counter, char} -> "#{counter}#{char}" end)
          |> Enum.join()

  defp count_unique_chars([]), do: []
  defp count_unique_chars([first | rest]) do
    count_chars(first, rest)
  end

  defp count_chars(char, string, counter \\ 1)
  defp count_chars(char, [], counter), do: [{counter, char}]
  defp count_chars(char, [next | rest], counter) when char != next,
       do: [{counter, char} | count_chars(next, rest)]
  defp count_chars(char, [next | rest], counter),
       do: count_chars(char, rest, counter + 1)
end
