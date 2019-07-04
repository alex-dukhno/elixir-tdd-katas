defmodule Fibonacci.Day01 do
  def create() do
    {:ok, pid} = Agent.start_link(fn -> %{1 => 1, 2 => 1} end)
    pid
  end

  def get(pid, index) do
    val = Agent.get(pid, fn state -> state[index] end)
    if val == nil do
      val = get(pid, index - 1) + get(pid, index - 2)
      Agent.update(pid, fn state -> Map.put(state, index, val) end)
      val
    else
      val
    end
  end
end
