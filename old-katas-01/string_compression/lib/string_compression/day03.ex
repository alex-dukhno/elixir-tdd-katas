defmodule StringCompression.Day03 do
  def compress(src) when is_binary(src), do:
    src
    |> String.graphemes()
    |> compress()

  def compress([]), do: ""
  def compress([c | tail]), do: compress(c, tail, 1)

  defp compress(current, [], counter), do: "#{counter}#{current}"
  defp compress(current, [next | rest], counter) when current == next, do:
    compress(current, rest, counter + 1)
  defp compress(current, [next | rest], counter), do:
    "#{counter}#{current}#{compress(next, rest, 1)}"
end
