+++
description = 'Main note on different resources for Linux kernel development.'
slug = 'linux-kernel'
tags = ['published']
title = 'Linux Kernel'
+++

## Linux Kernel

## Pending to check

This is a sort of *reading list* of topics I've seen mentioned while studying and should be checked later. I'll try to keep the list ordered by priority based on the reference I've read about it.

* [sysfs](https://docs.kernel.org/filesystems/sysfs.html)
* [core-api/workqueue](https://www.kernel.org/doc/html/latest/core-api/workqueue.html)

## Links

* [Kernel Index LWN.net](https://lwn.net/Kernel/Index/): below a list of the articles I've read and found useful.
  
  * [Linux Kernel Design Patterns - part 1 LWN.net](https://lwn.net/Articles/336224/): although it seems a bit outdated on the implementation, the pattern is still used.
* [kobjects and krefs: lockless reference counting for kernel structures](http://www.kroah.com/linux/talks/ols_2004_kref_paper/Reprint-Kroah-Hartman-OLS2004.pdf): a clearer look at the implementation and usage of kobjects and krefs. *Uses deprecated down() function for semaphore*. Read `kref.rst` for up to date documentation.
