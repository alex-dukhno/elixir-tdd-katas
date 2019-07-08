defmodule Fibonacci.Day05 do
  @cache __MODULE__

  def start_link(), do:
    Agent.start_link(fn -> %{1 => 1, 2 => 1} end, name: @cache)

  def get(index), do:
    Agent.get(@cache, &Access.get(&1, index))
    |> when_not_found(index)

  defp when_not_found(nil, index), do:
    compute(index)
    |> update(index)
  defp when_not_found(value, _index), do: value

  defp compute(index), do:
    get(index - 1) + get(index - 2)

  defp update(val, index), do:
    Agent.get_and_update(@cache, &put(&1, index, val))

  defp put(state, index, val), do: {val, Map.put(state, index, val)}
end
