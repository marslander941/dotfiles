#!/bin/bash

clear

xargs -I '{}' -n 1 -P 5 \
	youtube-dl -i \
	--ignore-config \
	--no-post-overwrites \
	--console-title \
	--no-call-home \
	--download-archive downloaded.txt \
	--no-warnings '{}' < x
