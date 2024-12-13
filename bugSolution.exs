```elixir
list = [1, 2, 3, 4, 5]

# Use Enum.map for parallel processing with Task.async_stream
result = for x <- list, into: [] do
  Task.async(fn ->
    if x == 3 do
      Process.sleep(1000) # Simulate a long-running operation
    end
    x
  end)
end

# Collect results
Enum.map(Task.await_many(result), fn task -> Task.result(task) end) |> Enum.each(&IO.puts/1)
```