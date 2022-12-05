#!/bin/bash

clear

xargs -I '{}' -n 1 -P 25 \
    youtube-dl -i 
	--ignore-config \
    --download-archive downloaded.txt \
    --no-post-overwrites \
	--no-warnings \
    --console-title \
	--no-call-home \
    --no-check-certificate '{}' < x
