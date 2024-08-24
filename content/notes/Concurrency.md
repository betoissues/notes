+++
tags = ['published']
title = 'Concurrency'
url = '/concurrency'
+++

## Actor Model

Is a *computational* model that describes *everything* as an *Actor*. These actors have 3 possible tasks:

1. Create another Actor
1. Send messages to other Actors
1. Determine the behavior/state for the next message it receives.

**Some applications**

* Email with accounts, messages and addresses.
* REST APIs, with endpoints working as addresses.

## Interrupt Handlers

Are one of the first concurrent programs [^1] . At the lowest level, these interrupts come in the form of hardware signals with *high-priority*. This interaction of the hardware telling something to the CPU, is what we refer to as interrupts[^2].

The implemented interrupt handler then requires a specific interrupt flag to react accordingly.

## Mutual Exclusion Solutions

First of all, a **mutex** is just a programming concept referring to how a thread, and only that thread, has access to a specific set of resources at a time.

* Dekker's Algorithm [^3]

````c
begin integer c1, c2 turn;
  c1:= 1; c2:= 1; turn = 1;
  parbegin
  process 1: begin A1: c1:= 0;
				   L1: if c2 = 0 then
						   begin if turn = 1 then goto L1;
								 c1:= 1;
							 B1: if turn = 2 then goto B1;
								 goto A1
						   end;
					   critical section 1;
					   turn:= 2; c1:= 1;
					   remainder of cycle 1; goto A1
			 end;
  process 2: begin A2: c2:= 0;
				   L2: if c1 = 0 then
						  begin if turn = 2 then goto L2;
								c2:= 1;
							B2: if turn = 1 then goto B2;
								goto A2
						  end;
					   critical section 2;
					   turn:= 1; c2:= 1;
					   remainder of cycle 2; goto A2
			 end
  parend
end .
````

* Peterson's Algorithm[^4]

````cpp
bool flag[2] = {false, false};
int turn;

P0:      flag[0] = true;
P0_gate: turn = 1;
         while (flag[1] && turn == 1)
         {
             // busy wait
         }
         // critical section
         ...
         // end of critical section
         flag[0] = false;

P1:      flag[1] = true;
P1_gate: turn = 0;
         while (flag[0] && turn == 0)
         {
             // busy wait
         }
         // critical section
         ...
         // end of critical section
         flag[1] = false;
````

## Types of Mutex Devices

### Semaphores

Semaphores "hold" the resources available and *lends* them to threads so they can access them for a limited period of time, while other threads wait for their required resources to be available [^5].

[^1]: [Actor model - Wikipedia](https://en.wikipedia.org/wiki/Actor_model#Message-passing_semantics)
[^2]: [Interrupt Handlers](https://tldp.org/LDP/lkmpg/2.6/html/x1256.html)
[^3]: [E.W.Dijkstra Archive: Cooperating sequential processes (EWD 123)](https://www.cs.utexas.edu/users/EWD/transcriptions/EWD01xx/EWD123.html)
[^4]: [Peterson's algorithm - Wikipedia](https://en.wikipedia.org/wiki/Peterson%27s_algorithm)
[^5]: [Implementing a Read/Write Mutex](https://doc.qt.io/archives/qq/qq11-mutex.html)
