+++
slug = 'os-development'
tags = ['published']
title = 'OS Development'
+++

This may or may not be directly related to [Linux Kernel](./Linux%20Kernel.md), that's the main reason it's in a separate note.

## The Bootloader

GRUB has to load the kernel at memory address equal or higher to 1MB, since lower values are reserved for GRUB, BIOS and I/O.

Basic Structure for ISO

````
iso
└── boot
    ├── grub
    │   ├── menu.lst
    │   └── stage2_eltorito
    └── kernel.elf
````

ISO Generation Command

````bash
genisoimage -R \ # From `cdrtools` package in Arch
                -b boot/grub/stage2_eltorito \
                -no-emul-boot \
                -boot-load-size 4 \
                -A os \
                -input-charset utf8 \
                -quiet \
                -boot-info-table \
                -o os.iso \
                iso
````

### Using C to write the kernel

Since C uses a stack, we need to make the `esp` (stack pointer) point at the end of a free memory space. To make sure enough space is available, we reserve space in the `bss` (block starting symbol) segment. The result is reserved space with the `esp` pointing at the end of it.

`cdecl` calling convention states that arguments to a function should be passed via the stack, right-to-left, and the result stored in `eax`.

Adding `__attribute__((packed));` tells the compiler not to adding any padding to structs, but this isn't part of the C standard.

````c
struct example {
    unsigned char config;
    unsigned short address;
    unsigned char index;
} __attribute__((packed));
````

## Hardware Interaction

Main two types of I/O:

* Memory-mapped I/O: works by changed values in specific addresses (i.e framebuffer).
* I/O Ports: uses *out* and *in* instructions for communication.

### Framebuffer

Bit:     | 15 14 13 12 11 10 9 8 | 7 6 5 4 | 3 2 1 0 |
Content: | ASCII                 | FG      | BG      |

## Compiling

Linking a loader into an ELF executable for the bootloader.

````bash
ld -T link.ld -melf_i386 loader.o -o kernel.elf
````

**Flags needed for removing standard library and compiling for a kernel**:

````bash
-m32 -nostdlib -nostdinc -fno-builtin -fno-stack-protector -nostartfiles -nodefaultlibs

# Recommended
-Wall -Wextra -Werror
````

## Books

[The little book about OS development](https://littleosbook.github.io/)
