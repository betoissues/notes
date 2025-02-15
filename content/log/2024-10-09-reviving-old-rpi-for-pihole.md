+++
date = '2024-10-09'
slug = '2024-10-09-reviving-old-rpi-for-pihole'
tags = ['published']
title = 'Reviving my old Raspberry Pi for Pi-Hole'
+++

The SSD in my HP EliteDesk 800 G5 running Proxmox died a couple of weeks ago, and I have been running without any of my local services. I've already ordered another M.2 drive for my desktop and will be moving the secondary SSD to this machine, as well as adding a second mini PC; but this also made me search for other low-cost alternatives.

I was reading about [Low-tech Magazine](https://solar.lowtechmagazine.com/2018/09/how-to-build-a-low-tech-website/)[^1] and found out the [Olimex Olinuxino A20 Lime 2](https://www.olimex.com/Products/OLinuXino/A20/A20-OLinuXino-LIME2/), a single board computer, and found it to be fairly capable for the price. While exploring the different options, I also found Libre Computer's "[Sweet Potato](https://libre.computer/products/aml-s905x-cc-v2/#)", which is a beast but doesn't include the Gigabit Ethernet port.

This research also got me to thinking about how many Ethernet ports I have available in my apartment, how I'm going to organize the new services, and everything else that comes with thinking about re-organizing servers. At some point I remembered I had a Raspberry Pi since around 2015; which to be fair I had no idea of the exact model.

In less than an hour I was getting a 16GB SD card with the plan of setting up [Pi-Hole](https://pi-hole.net/). I was surprised at how easy it is now to have an OS running with the [Raspberry Pi Imager](https://www.raspberrypi.com/software/)[^2], including SSH access via public keys, and using `raspbian-config` to configure the Pi.

After updating, the Pi-Hole one-liner took care of everything:

````bash
curl -sSL https://install.pi-hole.net | bash
````

This handled identifying the OS, installing Pi-Hole and handling all the basic configuration.

We'll see how this goes, it just feels good to finally take the RPI out of its box since I moved. I don't think there's anything else I'll be using it for, since it's the 512MB RAM version with a 100Mbps Ethernet port.

`cat /proc/cpuinfo`

````
processor       : 0
model name      : ARMv6-compatible processor rev 7 (v6l)
BogoMIPS        : 697.95
Features        : half thumb fastmult vfp edsp java tls
CPU implementer : 0x41
CPU architecture: 7
CPU variant     : 0x0
CPU part        : 0xb76
CPU revision    : 7

Hardware        : BCM2835
Revision        : 000e
Serial          : 00000000aba259df
Model           : Raspberry Pi Model B Rev 2
````

[^1]: Found this magazine exploring different webrings during the weekend. Might even consider joining one.

[^2]: Made it fairly easy to install Ubuntu (which only led to rainbow screen) and Raspbian in less than 20 minutes.
