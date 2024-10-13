#!/bin/bash

openring -n 3 -p 1 -l 100 -S static/openring-links.txt < _openring/in.html > layouts/partials/openring.html
hugo build
npx -y pagefind --site public
