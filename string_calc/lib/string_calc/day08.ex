defmodule StringCalc.Day08 do
  def compute(src), do:
    src
    |> String.graphemes()
    |> parse_expression()
    |> elem(0)

  defp parse_expression(src) when is_list(src), do:
    parse_term(src)
    |> parse_expression()

  defp parse_expression({num1, ["+" | rest]}) do
    {num2, rest} = parse_expression(rest)
    {num1 + num2, rest}
  end

  defp parse_expression({num1, ["-" | rest]}) do
    {num2, rest} = parse_expression(rest)
    {num1 - num2, rest}
  end

  defp parse_expression({num1, rest}), do: {num1, rest}

  defp parse_term(src) when is_list(src), do:
    parse_num(src)
    |> parse_term()

  defp parse_term({num1, ["×" | rest]}) do
    {num2, rest} = parse_term(rest)
    {num1 * num2, rest}
  end

  defp parse_term({num1, ["÷" | rest]}) do
    {num2, rest} = parse_term(rest)
    {num1 / num2, rest}
  end

  defp parse_term({num1, rest}) do
    {num1, rest}
  end

  defp parse_num(src) do
    {digits, rest} = src
                     |> Enum.split_while(&not_an_operator/1)

    num1 = digits
           |> Enum.join()
           |> String.to_float()

    {num1, rest}
  end

  defp not_an_operator(c), do: c not in ["+", "-", "×", "÷"]
end
