defmodule Fibonacci.Day08 do
  def start_link() do
    Agent.start_link(fn -> %{1 => 1, 2 => 1} end, name: :fibonacci)
    :ok
  end

  def get(index), do:
    Agent.get(:fibonacci, & &1[index])
    |> on_lookup(index, &compute/1)

  defp compute(index), do: get(index - 1) + get(index - 2)

  defp on_lookup(_not_found = nil, index, if_not_found), do:
    if_not_found.(index)
    |> update_cache(index)
  defp on_lookup(value, _index, _if_not_found), do: value

  defp update_cache(value, key), do:
    Agent.get_and_update(:fibonacci, &insert_into_cache(value, &1, key))

  defp insert_into_cache(value, cache, key), do:
    {value, Map.put(cache, key, value)}
end
