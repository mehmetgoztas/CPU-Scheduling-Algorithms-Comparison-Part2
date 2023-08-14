# CPU-Scheduling-Algorithms-Comparison-Part2

## Introduction

This project focuses on comparing two CPU scheduling algorithms: the Linux scheduling algorithm and our custom stride scheduler algorithm. Before diving into the details, let's provide a brief overview of these algorithms.

The Linux scheduling algorithm divides CPU time into epochs, each with a specified time quantum for processes. The time quantum varies among processes, and when a process exhausts its quantum, it gets preempted. The epoch ends when all runnable processes use up their quanta, and a new epoch starts with recalculated time-quantum values.

The stride scheduling algorithm aims to achieve proportional CPU capacity reservation among concurrent processes. It sequentially allocates resources in standard time-slices (quantums) based on process shares. A process with a higher share gets allocated more often than a process with a lower share.

## Design and Implementation

In this project, we have created several files, with the system call being a basic file for changing the flag's status. The flag represents the process's status. When the flag value is 1, the stride scheduler activates, functioning similarly to semaphores. The core of the project lies in the other programs.

### Fork Usage

The `fork` function creates a new process by making a copy of the required process and returning the process ID. To manipulate system data, we initialize variables such as `min` for the minimum value, `stride` for the stride mechanism, and `last_ticket` for the ticket number required in the stride scheduling principle. Dividing `stride` by `ticket` (420) is based on the least common multiple of the numbers 1 to 7.

### Scheduler Algorithm

The `sched.h` file is used to initialize variables also used in `fork.c`. We define essential parameters to store process parameters. In the `sched.c` file, we implement the main stride algorithm mechanics. Since we have multiple processes, we use an if block to move through each active process. Various variables and structures are used for data manipulation. The stride scheduler prioritizes the process with the lowest ticket number. We use a temporary variable to locate the activated process, and then we manage to swap to the next process in line.

When our temporary variable reaches the max value (420), we understand that we've scanned all processes. For each task, we initialize a pointer to 0, and this must be done atomically to ensure the process remains in an infinite loop until intentionally stopped.

## Conclusion

In conclusion, we have covered all aspects of our developed system. From A to Z, we experienced how scheduling algorithms work. As we can see from the results, the basic Linux scheduler works more fairly. The CPU usage of processes is closer to each other. Whether to consider this result as good depends on the user. Sharing the same resources might not be the best use case for some users. Some users may want to favor specific processes more. In summary, the Linux Scheduler selects the next process to be run in a mechanism that relies upon a global doubly linked list of the running processes. The loop block added in line 606 traverses the processes that are runnable and candidates for the next process.

