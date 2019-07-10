defmodule Fibonacci.Day07 do
  @cache __MODULE__

  def start_link(), do: Agent.start_link(fn -> %{1 => 1, 2 => 1} end, name: @cache)

  def get(index), do:
    Agent.get(@cache, & &1[index])
    |> lookup(index)

  defp lookup(_not_found = nil, index), do:
    compute(index)
    |> update_cache(index)

  defp lookup(value, _index), do: value

  defp compute(index), do: get(index - 1) + get(index - 2)

  defp update_cache(value, index), do:
    Agent.get_and_update(@cache, fn state -> {value, Map.put(state, index, value)} end)
end
