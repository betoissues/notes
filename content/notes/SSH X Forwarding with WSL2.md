+++
aliases = ['SSH X Forwarding with WSL2']
tags = ['published']
title = 'SSH X Forwarding with WSL2'
url = '/ssh-x-forwarding-wsl2'
+++

I had Ubuntu 18.04 LTS, so before anything I started by upgrading to 22.04 LTS (btw, `sudo apt remove --purge snapd` is useful in this scenario). Not without first facing an issue with not having connection with the Internet. Recently changed my desktop's motherboard, and this one has a built-in WiFi adapter, maybe it's related.

Based on this [superuser question](https://superuser.com/questions/1691097/wsl2-cannot-access-the-internet-on-windows-11) I only executed a few commands to fix this malformed `/etc/resolv.conf`.

````bash
sudo rm /etc/resolv.conf
sudo bash -c 'echo "nameserver 8.8.8.8" > /etc/resolv.conf'
sudo bash -c 'echo "[network]" > /etc/wsl.conf'
sudo bash -c 'echo "generateResolvConf = false" >> /etc/wsl.conf'
````

And finally from PWSH "rebooting" the OS with `wsl --shutdown`.

Found some mentions of `Xming` and `VcXsrv` while reading about GUI applications with WSL, until I wondered why it wasn't diretly available in WSL since I've noticed many people doing this to *replace* some of the need for Linux environment. Given this assumption, I went ahead and read about the [WSL1 vs WSL2 comparison](https://learn.microsoft.com/en-us/windows/wsl/compare-versions#comparing-wsl-1-and-wsl-2). Apparently I had to update my old Ubuntu subsystem to use WSL2 (which enables WSLg).

This was easy to do, just following the instructions in the WSLg readme.

````pwsh
wsl --list -v
wsl --set-version Ubuntu 2
wsl --shutdown
````

After doing this I was able to launch GUI applications from my Ubuntu subsystem; now to X forwarding.

All I had to do here was install `xauth` and make sure the `DISPLAY` environment variable was set correctly.

````bash
# both are set automatically in my case
export DISPLAY=:0 # locally
export DISPLAY=localhost:10.0 # remote
````

As for my `.ssh/config`, it ended up simply being as follows:

````
Host hostname
        HostName IP
        User USER
        Port PORT
        ForwardX11 Yes
        ForwardX11Trusted Yes
````
