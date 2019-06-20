defmodule StringCalc.Day01 do
  def compute(src) do
    compute(src, 0, 0, String.length(src))
  end

  defp compute(src, first, last, length) when length - 1 == last, do: parse_number(src, first, last)
  defp compute(src, first, last, length) do
    cond do
      String.at(src, last) == "+" ->
        parse_number(src, first, last - 1) + compute(src, last + 1, last + 1, length)
      String.at(src, last) == "-" && last > 1 ->
        parse_number(src, first, last - 1) - compute(src, last + 1, last + 1, length)
      true ->
        compute(src, first, last + 1, length)
    end
  end

  defp parse_number(src, from, to), do:
    src
    |> String.slice(from..to)
    |> String.to_float()
end
