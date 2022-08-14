defmodule StringCompression.Day01 do
  def compress(""), do: ""
  def compress(src) do
    [char | rest] = src
                 |> String.graphemes()
    compress(char, rest, 1)
    |> Enum.join()
  end

  def compress(char, [], counter),
      do: ["#{counter}#{char}"]

  def compress(char, [next_char | rest], counter) when char == next_char,
      do: compress(char, rest, counter + 1)

  def compress(char, [next_char | rest], counter),
      do: ["#{counter}#{char}" | compress(next_char, rest, 1)]
end
