defmodule StringCalc.Day04 do
  def compute(src), do:
    src
    |> String.graphemes()
    |> parse_expression()

  defp parse_expression(expression) do
    {num1, rest} = parse_term(expression)
    case rest do
      ["+" | rest] ->
        {num2, rest} = parse_term(rest)
        num1 + num2
      ["-" | rest] ->
        {num2, rest} = parse_term(rest)
        num1 - num2
      _ -> num1
    end
  end

  defp parse_term(term) do
    {num1, rest} = parse_num(term)
    case rest do
      ["×" | rest] ->
        {num2, rest} = parse_num(rest)
        {num1 * num2, rest}
      ["÷" | rest] ->
        {num2, rest} = parse_num(rest)
        {num1 / num2, rest}
      _ -> {num1, rest}
    end
  end

  defp parse_num([]), do: {0, ""}
  defp parse_num(src) do
    num = src
          |> Enum.take_while(&not_a_operator/1)
          |> Enum.join()
          |> String.to_float()

    rest = src
           |> Enum.drop_while(&not_a_operator/1)

    {num, rest}
  end

  defp not_a_operator(c), do: c not in ["+", "-", "×", "÷"]
end
