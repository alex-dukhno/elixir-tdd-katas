defmodule StringCalc.Day02 do
  def compute(src) do
    compute(src, 0, 0, String.length(src))
  end

  defp compute(src, first, last, length) when length - 1 == last, do:
    parse_term(src, first, last, length)
  defp compute(src, first, last, length) do
    cond do
      String.at(src, last) == "+" ->
        parse_term(src, first, first, last) + compute(src, last + 1, last + 1, length)
      String.at(src, last) == "-" && last > 1 ->
        parse_term(src, first, first, last) - compute(src, last + 1, last + 1, length)
      true -> compute(src, first, last + 1, length)
    end
  end

  defp parse_term(src, first, last, length) do
    cond do
      String.at(src, last) == "×" ->
        parse_num(src, first, last - 1) * parse_term(src, last + 1, last + 1, length)
      String.at(src, last) == "÷" ->
        parse_num(src, first, last - 1) / parse_term(src, last + 1, last + 1, length)
      true ->
        parse_num(src, first, length - 1)
    end
  end

  defp parse_num(src, first, last), do:
    src
    |> String.slice(first..last)
    |> String.to_float()
end
