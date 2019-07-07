defmodule Fibonacci.Day04 do
  @cache __MODULE__

  def start_link(), do: Agent.start_link(fn -> %{1 => 1, 2 => 1} end, name: @cache)

  def get(index), do:
    Agent.get(@cache, &Access.get(&1, index))
    |> complete_when_not_found(index, fn -> get(index - 1) + get(index - 2) end)

  defp complete_when_not_found(nil, index, if_not_found), do:
    if_not_found.()
    |> update_cache_with(index)

  defp complete_when_not_found(value, _index, _if_not_found), do: value

  defp update_cache_with(value, index), do:
    Agent.get_and_update(@cache, &put(&1, value, index))

  defp put(state, value, index), do:
    {value, Map.put(state, index, value)}
end
