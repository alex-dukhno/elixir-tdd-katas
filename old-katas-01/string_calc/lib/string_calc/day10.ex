defmodule StringCalc.Day10 do
  def compute(src), do:
    src
    |> String.graphemes()
    |> parse_expression()
    |> elem(0)

  defp parse_expression(src) when is_list(src), do:
    src
    |> parse_term()
    |> parse_expression()

  defp parse_expression({result, ["+" | rest]}), do:
    rest
    |> parse_expression()
    |> addition(result)

  defp parse_expression({num, ["-" | rest]}), do:
    rest
    |> parse_expression()
    |> subtraction(num)

  defp parse_expression({num, rest}), do: {num, rest}

  defp addition({addendum, rest}, result), do: {result + addendum, rest}
  defp subtraction({subtrahend, rest}, result), do: {result - subtrahend, rest}

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

  defp multiplication({multiplier, rest}, result), do: {result * multiplier, rest}
  defp division({divisor, rest}, result), do: {result / divisor, rest}

  defp parse_num(src) do
    {digits, rest} = Enum.split_while(src, fn c -> c not in ["+", "-", "×", "÷"] end)

    num = digits
          |> Enum.join()
          |> String.to_float()

    {num, rest}
  end
end
