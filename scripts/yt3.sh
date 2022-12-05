#!/bin/bash

clear

xargs -I '{}' -n 1 -P 3 \
	youtube-dl -i \
	--ignore-config \
	--no-post-overwrites \
	--console-title \
	--newline \
	--no-call-home \
	--download-archive downloaded.txt \
	--no-warnings '{}' < x
