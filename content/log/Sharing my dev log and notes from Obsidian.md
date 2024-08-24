+++
date = '2024-08-24'
slug = '2024-08-24-publishing-obsidian-notes'
tags = ['published']
title = 'Sharing my dev log and notes from Obsidian'
+++

After I had to do some troubleshooting yesterday to get GUI applications working from [SSH using WSL2 with X Forwarding](SSH%20X%20Forwarding%20with%20WSL2.md), I decided to start publishing some of my "dev notes" from my Obsidian vault.

Inspired by other people on the internet, I'll also be sharing a more frequent "log" of the technical (and maybe not so) things I'm constantly working on.

To do this I'll be using `hugo` as SSG, with a script (leveraging) other tools, that so far looks something like this.

````bash
#! /bin/bash
VAULT_PATH="/vault/path"
DEST_PATH="$HOME/hugo-site-path"
FLAGS="--only-tags published --frontmatter always --start-at"

set -x
cd $DEST_PATH
obsidian-export $VAULT_PATH $FLAGS $VAULT_PATH/07\ Wiki $DEST_PATH/content &&
hugo convert toTOML --logLevel debug --unsafe
# required to fix some footnotes issues
find . -type f -name "*.md" -exec sed -i -e 's/^[ \t]*\(\[^[0-9]]:.*$\)/\1/' {} \;
````

Along with Obsidian's Templater plugin and [obsidian-export](https://github.com/zoni/obsidian-export) I hope this becomes a reliable way to share my knowledge in a short-form way.
