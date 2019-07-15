defmodule Fibonacci.Day12 do
  def start_link(), do:
    Agent.start_link(fn -> %{1 => 1, 2 => 1} end, name: :cache)
    |> elem(0)

  def get(index), do:
    Agent.get(:cache, fn state -> state[index] end)
    |> after_cache_lookup(index, &compute/1)

  defp after_cache_lookup(_not_found = nil, index, if_not_found), do:
    if_not_found.(index)
    |> get_and_update(index)

  defp after_cache_lookup(value, _index, _if_not_found), do: value

  defp compute(index), do: get(index - 1) + get(index - 2)

  def get_and_update(value, index), do:
    Agent.get_and_update(:cache, &update_cache(&1, index, value))

  defp update_cache(map, key, value), do: {value, Map.put(map, key, value)}
end
