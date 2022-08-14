defmodule Fibonacci.Day03 do
  @cache __MODULE__

  def start_link(), do: Agent.start_link(fn -> %{1 => 1, 2 => 1} end, name: @cache)

  def get(index), do:
    @cache
    |> Agent.get(&Access.get(&1, index))
    |> on_get(index)

  defp on_get(_not_found = nil, index) do
    val = get(index - 1) + get(index - 2)
    Agent.update(@cache, &Map.put(&1, index, val))
    val
  end
  defp on_get(value, _index), do: value
end
