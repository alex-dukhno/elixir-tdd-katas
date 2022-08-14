defmodule Fibonacci.Day14 do
  def start_link(), do:
    Agent.start_link(fn -> %{1 => 1, 2 => 1} end, name: :cache)
    |> elem(0)

  def get(index), do:
    Agent.get(:cache, fn state -> state[index] end)
    |> after_cache_lookup(index, fn index -> get(index - 1) + get(index - 2) end)

  defp after_cache_lookup(_not_found = nil, index, if_not_found), do:
    if_not_found.(index)
    |> update_and_return(index)

  defp after_cache_lookup(value, _index, _if_not_found), do: value

  defp update_and_return(value, index) do
    Agent.update(:cache, &Map.put(&1, index, value))
    value
  end
end
