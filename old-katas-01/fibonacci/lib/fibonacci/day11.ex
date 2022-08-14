defmodule Fibonacci.Day11 do
  def start_link() do
    Agent.start_link(fn -> %{1 => 1, 2 => 1} end, name: :cache)
    :ok
  end

  def get(index), do:
    Agent.get(:cache, & &1[index])
    |> cache_lookup(index, &compute/1)

  defp cache_lookup(_not_found = nil, index, if_not_found), do:
    if_not_found.(index)
    |> get_and_update(index)

  defp cache_lookup(value, _index, _if_not_found), do: value

  defp compute(index), do: get(index - 1) + get(index - 2)

  defp get_and_update(value, key), do:
    Agent.get_and_update(:cache, &update_cache(&1, key, value))

  defp update_cache(map, key, value), do: {value, Map.put(map, key, value)}
end
