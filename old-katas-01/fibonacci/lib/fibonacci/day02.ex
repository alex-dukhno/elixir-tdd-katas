defmodule Fibonacci.Day02 do
  @me __MODULE__

  def create() do
    Agent.start_link(fn -> %{1 => 1, 2 => 1} end, name: @me)
  end

  def get(index) do
    val = Agent.get(@me, fn state -> state[index] end)
    if val == nil do
      val = get(index - 1) + get(index - 2)
      Agent.update(@me, &put_in(&1[index], val))
      val
    else
      val
    end
  end
end
