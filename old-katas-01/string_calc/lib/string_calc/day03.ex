defmodule StringCalc.Day03 do
  @operators ["+", "-", "×", "÷"]

  def compute(src) do
    graphemes = String.graphemes(src)
    compute(graphemes, tl(graphemes), 0)
  end

  defp compute(src, [], first) do
    {_index, num} = parse_num(src, first)
    num
  end
  defp compute(src, [c | rest], start) do
    cond do
      c == "+" ->
        {index, num} = parse_num(src, start)
        num + compute(src, rest, start + index + 1)
      c == "-" ->
        {index, num} = parse_num(src, start)
        num - compute(src, rest, start + index + 1)
      c == "×" ->
        {index, num} = parse_num(src, start)
        num * compute(src, rest, start + index + 1)
      c == "÷" ->
        {index, num} = parse_num(src, start)
        num / compute(src, rest, start + index + 1)
      true -> compute(src, rest, start)
    end
  end

  defp parse_num(src, start_at) do
    digits = src
             |> Enum.drop(start_at)
             |> Enum.take_while(fn c -> c not in @operators end)

    num = digits
          |> Enum.join()
          |> String.to_float()

    {start_at + length(digits), num}
  end
end
