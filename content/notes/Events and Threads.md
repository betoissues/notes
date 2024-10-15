+++
aliases = ['/events-and-threads']
altitude = 0
created = '2020-12-07 01:35:24Z'
latitude = 8.9948
longitude = -79.523
slug = 'events-and-threads'
tags = ['published']
title = 'Events and Threads'
updated = '2020-12-07 22:50:08Z'
+++

## Event-Driven Programming

Works on an event loop that waits for events and invokes handlers capable of callbacks. These handlers are generally implemented to execute *short-lived* actions.

Handlers **must** be short-lived because long-running handlers could make the application non-responsive; so event loop aren't real CPU concurrency.

Even some event-driven applications rely on shared memory in a few places[^1].

## Threads

**Reasons threads are bad**[^2]

Threads come from OS definition and are tightly related to processes, but they're very hard to program.

* Threads must coordinate access to shared data with locks.
* Processes depend on each other, so when one process is waiting for the other to unlock a resource vice-versa, we end up with a **deadlock** caused by the circular dependency.
* They're hard to debug because of the dependencies (tl;dr multiple processes)
* Implementation depends on the destination system.

Threads are still important for real concurrency and high-end servers like databases.

It's easier to think about threads as the sequential steps for any particular task, where different tasks belong to different threads.[^1]

:exclamation: Locks are one of the biggest issues when working with threads.

## Events vs Threads

*Most* of the time **events** are better.

* Events are easier to implement.
* Implementation complexity is proportional to the use-case of the application, while threads face the full complexity even for the simplest application.
* It's easier to debug events, for example, with breakpoints directly in the event handlers.
* Events are more portable.
* Threads provide true concurrency.

**Mapping of the thread and event models**[^1]

|**thread-based**|**event-driven**|
|------------|------------|
|monitor|event handler|
|scheduling|event loop|
|exported function|event types accepted by event handler|
|returning from a procedure|dispatching a reply|
|executing a blocking procedure call|dispatching a message, awaiting reply|
|waiting on condition variables|awaiting messages|

## References

[^1]: [The Case of Threads vs Events](https://berb.github.io/diploma-thesis/original/043_threadsevents.html)
    

[^2]: [Why Threads Are A Bad Idea (for most purposes)](https://web.stanford.edu/~ouster/cgi-bin/papers/threads.pdf) -- OUSTERHOUT, John: Why Threads are a Bad Idea (for most purposes),: USENIX Winter Technical Conference
