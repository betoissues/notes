+++
date = '2025-02-19'
description = 'Nothing beats updating your system and finding out it boots to GRUB the next day.'
slug = '2025-02-19-archlinux-boots-to-grub'
tags = ['published']
title = 'Archlinux randomly booting to GRUB (surprise)'
+++

I've been very excited because I'm back to using my Linux machine as I mentioned [last weekend](2025-02-15-weekend-updates.md).

Imagine how I felt this evening when I pressed the power button, went for some water and found myself in a GRUB console.

First issue was to boot to Archlinux, which in the past been simply solved by booting into a live ISO and fixing everything from there.

This time I couldn't find a single USB stick to do this. Luckily it wasn't that hard to boot directly from the GRUB console.

It was a bit different because of btrfs subvolumes, but not really that complicated once you have the correct options.

````bash
set root=(hd0,gpt2)
linux (hd0,gpt2)/@/boot/vmlinuz-linux root=/dev/nvme0n1p2 rootflags=subvol=@
initrd (hd0,gpt2)/@/boot/initramfs-linux.img
boot
````

As you can see, having the subvolumes obfuscates a bit the commands by adding the `@` but in general rules, it's the same just different paths. When setting up the kernel passing `rootflags=subvol=@subvolume-name` was necessary.

The other issue I had was setting up the root partition (`root=`). After using `cat (hd0,gpt2)/@/etc/fstab` and finding myself in the limited kernel shell because of the device "not being found", when I clearly took it from the fstab, running `blkid` in the kernel shell solved my problem.

Turns out I was reading a comment above the fstab entry, and the comment had the wrong device number 👍.

Of course it wasn't finding the root partition (well, it could've found a different device). Next time (hopefully there's not) I'll try using the UUID.

So I've managed to boot but, what happened?

From what I can tell, there was an issue with timeshift generating the btrfs snapshots via the pacman hook, forcing me to regenerate the grub configuration manually.

At least now I know how to boot from GRUB.
