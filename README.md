# Shell Script Race Condition: Counter Increment

This repository demonstrates a race condition bug in a shell script. The script attempts to increment a counter in a file using two concurrent processes. Due to the lack of synchronization mechanisms, the final counter value may not be 2, as expected. This highlights the importance of proper concurrency control in shell scripts.

## Bug Description

The `bug.sh` script uses two background processes to increment a counter stored in `counter.txt`.  The lack of locking or atomic operations allows a race condition to occur, where one process might overwrite the other's changes.

## Solution

The `bugSolution.sh` script addresses the race condition by employing a `flock` command to acquire an exclusive lock on the `counter.txt` file before incrementing the counter and releasing the lock afterwards. This ensures that only one process can modify the file at any given time.

## How to Reproduce the Bug

1. Clone this repository.
2. Run `bash bug.sh`. Observe that the final counter value is not always 2.
3. Run `bash bugSolution.sh`. Observe that the final counter value is consistently 2.