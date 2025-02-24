#!/bin/bash

# This script demonstrates a solution to the race condition by using flock to ensure exclusive access to the file

# Create a file with an initial counter value
echo 0 > counter.txt

# Function to increment the counter using flock
increment_counter() {
  flock -x -n 200 < counter.txt || exit 1 # Acquire exclusive lock; exit if can't obtain lock.
  local current_value=$(cat counter.txt)
  local new_value=$((current_value + 1))
echo $new_value > counter.txt
flock -u 200 # Release the lock
}

# Create two processes to increment the counter
increment_counter &
increment_counter &

# Wait for the processes to finish
wait

# Check the final counter value. It will be 2
echo "Final counter value: $(cat counter.txt)"