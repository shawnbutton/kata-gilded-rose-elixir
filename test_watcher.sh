# Run tests whenever files are changed.

# You will need fswatch installed (available in homebrew and friends)
# The command below will run tests and wait until fswatch writes something.
# The --stale flag will only run stale entries, it requires Elixir v1.3.
fswatch --one-per-batch --latency=0.01 lib/ test/ | mix test --stale --listen-on-stdin