+++
slug = 'one-liners'
tags = ['published']
title = 'One-Liners'
+++

## Download archived entries from Reader Readwise export

This only fetches http links, and uses `urldl.sh` from my dotfiles to download the article view.

````bash
csvcut -c URL,Location export.csv | grep "^http.*archive$" | cut -d, -f1 | while read -r url; do urldl.sh "$url"; done
````
