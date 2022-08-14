defmodule Fibonacci.Day13 do
  def start_link(), do:
    Agent.start_link(fn -> %{1 => 1, 2 => 1} end, name: :cache)
    |> elem(0)

  def get(index), do:
    Agent.get(:cache, fn state -> state[index] end)
    |> after_cache_lookup(index, &compute/1)

  defp after_cache_lookup(_not_found = nil, index, if_not_found), do:
    if_not_found.(index)
    |> update_cache(index)

  defp after_cache_lookup(value, _index, _if_not_found), do: value

  defp compute(index), do: get(index - 1) + get(index - 2)
  defp update_cache(value, key), do: Agent.get_and_update(:cache, &get_and_update(&1, key, value))
  defp get_and_update(map, key, value), do: {value, Map.put(map, key, value)}
end
