+++
slug = 'data-structures'
tags = ['published']
title = 'Data Structures'
+++

## Hash Tables

The index number is calculated from the value of the item being stored. With this there's no need to "search", but only make the hash calculation for direct access.

````
# Common hashing algorithm
address = key Mod n
````

[Hash Tables and Hash Functions](https://www.youtube.com/watch?v=KyUTuwz_b7Q&pp=ygUVaGFzaCB0YWJsZXMgZXhwbGFpbmVk)

**Collisions**:

The practice of occupying another empty space when the calculated index matches with another is called **open-addressing**.

Two values calculate to the same index, the most basic approach is carrying over to the next free slot. This one in particular is **linear probing**, where it linearly looks for the next empty slot.

Load Factor: ratio between the items stored and the size of the array. This is considered when using variable size data structures.

````
lf = items stored / array size
````

There's also **closed-addressing**, where each index value is a pointer to the data we're storing. When there's a collision, the incoming item is stored in the respective linked list.
