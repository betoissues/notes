#!/bin/bash

shopt -s nocasematch

opt="$1"
case $opt in
	build-only)
		hugo
		npx -y pagefind --site public
	;;
	*)
		openring -n 3 -p 1 -l 100 -S static/openring-links.txt < _openring/in.html > layouts/partials/openring.html
		hugo
		npx -y pagefind --site public
	;;
esac
