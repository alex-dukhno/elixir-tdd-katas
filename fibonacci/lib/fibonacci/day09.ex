defmodule Fibonacci.Day09 do
  def start_link() do
    Agent.start_link(fn -> %{1 => 1, 2 => 1} end, name: :cache)
    :ok
  end

  def get(index), do:
    Agent.get(:cache, fn state -> state[index] end)
    |> update_cache_if_not_found(index, &compute/1)

  defp update_cache_if_not_found(_not_found = nil, index, if_not_found), do:
    if_not_found.(index)
    |> update_cache(index)

  defp update_cache_if_not_found(value, _index, _if_not_found), do:
    value

  defp compute(index), do: get(index - 1) + get(index - 2)

  defp update_cache(value, key), do:
    Agent.get_and_update(:cache, &get_and_update(&1, key, value))

  defp get_and_update(state, key, value), do: {value, Map.put(state, key, value)}
end
