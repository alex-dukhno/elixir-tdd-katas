defmodule StringCalc.Day06 do
  def compute(src), do:
    src
    |> String.graphemes()
    |> parse_expression()
    |> elem(0)

  defp parse_expression(src) do
    {num1, rest} = src
                   |> parse_term()
    case rest do
      ["+" | rest] ->
        {num2, rest} = rest
                       |> parse_expression()
        {num1 + num2, rest}
      ["-" | rest] ->
        {num2, rest} = rest
                       |> parse_expression()
        {num1 - num2, rest}
      _ -> {num1, rest}
    end
  end

  defp parse_term(src) do
    {num1, rest} = src
                   |> parse_num()
    case rest do
      ["×" | rest] ->
        {num2, rest} = rest
                       |> parse_term()
        {num1 * num2, rest}
      ["÷" | rest] ->
        {num2, rest} = rest
                       |> parse_term()
        {num1 / num2, rest}
      _ -> {num1, rest}
    end
  end

  defp parse_num(src) do
    {digits, rest} = src
                     |> Enum.split_while(&not_an_operator/1)

    num = digits
          |> Enum.join()
          |> String.to_float()

    {num, rest}
  end

  defp not_an_operator(c), do: c not in ["+", "-", "×", "÷"]
end
