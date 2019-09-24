defmodule StringCompression.Day02 do
  def compress(""), do: ""
  def compress(src) do
    [c | chars] = src
    |> String.graphemes()
    compress(c, chars, 1)
  end

  defp compress(c, [], count), do: "#{count}#{c}"
  defp compress(c, [n | rest], count) when c == n, do: compress(c, rest, count + 1)
  defp compress(c, [n | rest], count), do: "#{count}#{c}#{compress(n, rest, 1)}"
end
