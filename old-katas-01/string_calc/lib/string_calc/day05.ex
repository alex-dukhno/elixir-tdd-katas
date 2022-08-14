defmodule StringCalc.Day05 do
  def compute(src), do:
    String.graphemes(src)
    |> parse_expression()
    |> elem(0)

  defp parse_expression(src) do
    {num1, rest} = parse_term(src)
    case rest do
      ["+" | rest] ->
        {num2, rest} = parse_expression(rest)
        {num1 + num2, rest}
      ["-" | rest] ->
        {num2, rest} = parse_expression(rest)
        {num1 - num2, rest}
      _ -> {num1, rest}
    end
  end

  defp parse_term(src) do
    {num1, rest} = parse_num(src)
    case rest do
      ["×" | rest] ->
        {num2, rest} = parse_term(rest)
        {num1 * num2, rest}
      ["÷" | rest] ->
        {num2, rest} = parse_term(rest)
        {num1 / num2, rest}
      _ -> {num1, rest}
    end
  end

  defp parse_num(src) do
    {digits, rest} = Enum.split_while(src, &not_an_operator/1)

    {String.to_float(Enum.join(digits)), rest}
  end

  defp not_an_operator(c), do: c not in ["+", "-", "×", "÷"]
end
