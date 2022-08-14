defmodule StringCalc.Day13 do
  def compute(src), do:
    src
    |> String.graphemes()
    |> parse_expression()
    |> elem(0)

  defp parse_expression(src) when is_list(src), do:
    src
    |> parse_term()
    |> parse_expression()

  defp parse_expression({num, ["+" | rest]}), do:
    rest
    |> parse_expression()
    |> addition(num)

  defp parse_expression({num, ["-" | rest]}), do:
    rest
    |> parse_expression()
    |> subtraction(num)

  defp parse_expression({num, rest}), do: {num, rest}

  defp addition({num2, rest}, num), do: {num + num2, rest}
  defp subtraction({num2, rest}, num), do: {num - num2, rest}

  defp parse_term(src) when is_list(src), do:
    src
    |> parse_num()
    |> parse_term()

  defp parse_term({num, ["×" | rest]}), do:
    rest
    |> parse_term()
    |> multiplication(num)

  defp parse_term({num, ["÷" | rest]}), do:
    rest
    |> parse_term()
    |> division(num)

  defp parse_term({num, rest}), do: {num, rest}

  defp multiplication({num2, rest}, num), do: {num * num2, rest}
  defp division({num2, rest}, num), do: {num / num2, rest}

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
