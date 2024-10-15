+++
aliases = ['/c-programming']
slug = 'c-programming'
tags = ['published']
title = 'C Programming'
+++

## Libraries

A **static library** is included inside the binary file, while the **dynamic library** is linked to the binary, which means it's not included within it. Dynamic libraries can be compiled independently of the executable.

Dynamically linked binaries depend on the libraries available in the system.

````bash
# Find the library locally
whereis library-name

# Helps inspecting the symbols. (`-D` for dynamic libraries).
nm -D library-location
````

### Static Libraries

Creating a static library requires first compiling, without linking, and creating an archive.

````bash
gcc -Wall -Wextra -pedantic -std=c99 -c file.c
ar -cvr libfile.a file.o

# Compile everything
gcc -Wall -Wextra -pendantic -std=c99 main.c libfile.a -o main
# Remove symbols
strip main
````

To compile a statically linked binary we'll need to install it system-wide with similar steps to [installing dynamic libraries](#installing-dynamic-libraries), but using the archive format (`.a`). With the difference that the static library doesn't require the executable bit.

````bash
gcc -Wall -Wextra -pedantic -std=c99 -static main.c -lfile -o main
````

### Dynamic Libraries

A dynamic library needs to be compiled as Position-Independent Code (PIC), so it can be executed at different addresses in different processes.

Aftwards, a shared object (`.so`) is required to be able to load at runtime. The real name, must follow the `lib[lib-name].so.[major-version].?[minor-version]`

````bash
# Generate Position-Independent Code(PIC)
gcc -Wall -Wextra -pedantic -fPIC -c file.c
gcc -shared -Wl,-soname,libfile.so -o libfile.so.1 file.o
# `-L` includes the path required to find `-lfile` since it's not globally installed
gcc -L${PWD} -lfile main.c -o main

# Check .so symbols
readelf --symbols
````

Dynamic libraries can be loaded from custom paths setting the `LD_LIBRARY_PATH` environment variable.

````bash
export LD_LIBRARY_PATH=${PWD}:${LD_LIBRARY_PATH}
````

We can check which libraries are dynamically linked to our executable by running `ldd [executable-name]`.

### Installing Dynamic Libraries

Libraries installed by the user should be located in `/usr/local/lib`.

````bash
sudo install -o root -g root -m 755 libfile.so.1 /usr/local/lib/libfile.so.1
# To use `#include <file.h>` instead of `#include "file.h"`
sudo install -o root -g root -m 644 file.h /usr/local/include/file.h
sudo ldconfig # This creates a symbolic link libfile.so
````
