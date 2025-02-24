#!/bin/bash

# This script demonstrates a race condition where two processes try to modify a shared file simultaneously.

# Create a file with an initial counter value
echo 0 > counter.txt

# Function to increment the counter
increment_counter() {
  local current_value=$(cat counter.txt)
  local new_value=$((current_value + 1))
echo $new_value > counter.txt
}

# Create two processes to increment the counter
increment_counter &
increment_counter &

# Wait for the processes to finish
wait

# Check the final counter value. It might not be 2 if a race condition occurs.
echo "Final counter value: $(cat counter.txt)"