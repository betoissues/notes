+++
tags = ['published']
title = 'Proxmox'
+++

## Hardware Acceleration

Check if IOMMU is enabled:

````bash
dmesg |grep -e DMAR -e IOMMU -e AMD-V
````

On GRUB systems (no ZFS), add the `intel_iommu=on` flag to `/etc/default/grub` and then execute `update-grub`.

UEFI systems with ZFS, may need to add this parameter to `/etc/kernel/cmdline`.
