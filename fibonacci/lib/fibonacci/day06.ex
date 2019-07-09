defmodule Fibonacci.Day06 do
  @cache __MODULE__

  def start_link(), do:
    Agent.start_link(&create_cache/0, name: @cache)

  defp create_cache(), do: %{1 => 1, 2 => 1}

  def get(index), do:
    Agent.get(@cache, & &1[index])
    |> if_not_found(index)

  defp if_not_found(nil, index), do:
    compute(index)
    |> update_cache(index)
  defp if_not_found(value, _index), do: value

  defp compute(index), do: get(index - 1) + get(index - 2)

  defp update_cache(value, index),
       do: Agent.get_and_update(@cache, &get_and_update(&1, index, value))

  defp get_and_update(state, index, val), do: {val, Map.put(state, index, val)}
end
