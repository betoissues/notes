+++
aliases = ['/systems-programming']
slug = 'systems-programming'
tags = ['published']
title = 'Systems Programming'
+++

## Daemons

### Double-fork technique

1. The parent process forks and exits.
1. Child process creates a new session via `setsid()` and becomes a new session leader.
1. In the new session it forks again (grandchildren) to prevent attaching to a terminal. Here is where the daemon itself gets executed.

## Additional Resources

### Books

* [Linux System Programming Techniques by Jack-Benny Persson](https://www.amazon.com/Linux-System-Programming-Techniques-proficient/dp/1789951283) (2021) (1789951283)
