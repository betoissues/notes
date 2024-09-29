+++
date = '2024-09-29'
slug = '2024-09-29-tiling-wm-macos-yabai'
tags = ['published']
title = 'Tiling WM in MacOS with yabai'
+++

Since I switched to MacOS the only software I've used to manage my windows has been Rectangle[^1], which I mostly used for 2 column view and maximizing a window.

A while back I started struggling with too many windows being open, going unnoticed and having to reach my mouse anyway to select them "comfortably". I try to use my keyboard for everything I can, one of the reasons I've tried multiple CLI tools wherever possible.

I didn't even know other "window managers" existed for MacOS, even less that they had tiling capabilities. Not even on Linux did I use tiling WMs, sticking to 2bwm[^2], it just felt like a good time for a change. The reasoning behind trying tiling this time is to clean my workspaces more frequently from those unused applications that are left open.

Amethyst[^3] was the first option I tried, only for 30 minutes until I got annoyed by all the defaults and different layouts available; there were also some errors when trying to save the configuration from the UI. I was looking for something simple, where I could choose what to enable, so ended up trying yabai[^4].

Yabai is a CLI to control windows, but hotkeys can be configured using skhd[^5]. It also allows for more customization goodies by disabling MacOS SIP (system integrity protection), but I chose not to enable these features on my work machine.

The keybinds are simple calls to the `yabai` binary. The only thing I'm having issues right now is with switching windows when using the stacked layout. Here's an example of the basic configuration:

````
# focus window
alt - h : yabai -m window --focus west
alt - l : yabai -m window --focus east
alt - j : yabai -m window --focus south
alt - k : yabai -m window --focus north

shift + alt - n : yabai -m window --focus next || yabai -m window --focus first
shift + alt - p : yabai -m window --focus prev || yabai -m window --focus last
shift + alt - m : yabai -m window --focus prev || yabai -m window --focus last

# swap managed window
shift + alt - h : yabai -m window --swap west
shift + alt - l : yabai -m window --swap east
shift + alt - j : yabai -m window --swap south
shift + alt - k : yabai -m window --swap north
````

The configuration for yabai and skhd is fairly straightforward, and I've included it in my dotfiles repository[^6].

[^1]: [Rectangle](https://rectangleapp.com)
[^2]: [2bwm](https://github.com/venam/2bwm)
[^3]: [Amethyst](https://github.com/ianyh/Amethyst)
[^4]: [yabai](https://github.com/koekeishiya/yabai)
[^5]: [skhd](https://github.com/koekeishiya/skhd)
[^6]: [My dotfiles repository](https://github.com/betoissues/config/tree/master/macos-wm)
