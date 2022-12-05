#!/bin/bash

clear

xargs -I '{}' -n 1 -P 15 \
    youtube-dl -i --ignore-config \
    --download-archive downloaded.txt \
    --no-post-overwrites --external-downloader aria2c \
    --external-downloader-args "-x 5 -s 5 -k 3M" '{}' < x


# x has URLs of videos, one per line
# xargs takes each URL and runs youtube-dl
# -P 10 downloads 10 videos at the same time
# -i ignore errors
# --ignore-config skips the youtube-dl.conf file
# --download-archive saves completed video filenames in a txt file
# aria2c increases download speed

