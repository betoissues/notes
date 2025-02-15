+++
date = '2025-02-15'
description = 'A couple updates from this week, including going back to my Linux desktop, workflow adjustments, and the new main site.'
slug = '2025-02-15-weekend-updates'
tags = ['published']
title = 'Weekend Updates - Feb 15th 2025'
+++

Similar to what I did a couple of months ago, here's an update of what I've been up to in the recent weeks. I might post a different entry about the months I went missing and other things I've been up to.

There are always a few episodes where I don't use machines besides my work computer, but every single time I come back to my Linux machine I begin to start feeling at home again.

## Changing my main website and migrating posts

In case you haven't noticed, this website is now hosted as my main one, ditching the `notes.` subdomain. Why did I do this? Well, it just made sense to me as the "blog posts" were already being added to the `log/` section and the notes lived within (guess) `notes/`.

It's also easier to manage a single set of blog posts when all of them are just thoughts and learnings. This also means the blog will have a mix of both short entries, and more elaborate ones like the one about Focus.

Another implication of merging the posts was the multilanguage support, which was also removed. I'll offer a single version on the pages (in English) and individual posts are yet to have their default content language set.

My hopes are for this change to be for the best and help me be more consistent as this site's files live within my notes vault in Obsidian and there won't be as much friction when writing to it.

## Managing my dotfiles with yadm

I've decided to start testing [yadm](https://yadm.io/) to make it easier to support configuration for different machines and using templates. While these could be done with custom scripts, my [current dotfiles](https://github.com/betoissues/config) needed a cleanup anyways; so I'm taking the start fresh option.

Main pain points with current dotfiles:

* Current structure per application doesn't reflect the dotfiles real structure in a single tree.
* Alternate configuration per application need linking single files or creating alternate directories.
* Symlinks are weird. Directory symlinks, are weirder.
* No templating, requiring custom scripts.

I did consider using [chezmoi](https://www.chezmoi.io/) but it opted for yadm's simplicity.

## Theming and workflow adjustments with CLI tools

Along these new changes to my dotfiles I've included a couple applications I had tried before, making adjustments to my liking and making sure everything behaves similarly on different systems.

Here's a summary of these changes:

* Changed font to [Iosevka](https://github.com/be5invis/Iosevka).
* Changed my wezterm, neovim and tmux theme to [zenbones](https://github.com/zenbones-theme/zenbones.nvim) with a darker background. This is more pleasant to my eyes and removes a lot of distracting highlights from my editor.
* Finally set up [w3m](https://w3m.sourceforge.net/)[^1] in a way that the keybinds and workflow makes sense to me. This was complemented by [reader](https://github.com/mrusme/reader)[^2] for article view and exporting.
* Included seamless navigation within neovim and tmux panes.

[^1]: A CLI web browser with image rendering support.

[^2]: Reader allows rendering webpages in "reader mode" with colored styling, image support, custom width (this is great for reading in a terminal), and allows exporting to markdown.
