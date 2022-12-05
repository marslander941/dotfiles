#!/bin/bash
clear

### 'vcs' command is from 'video contact sheet' github project
#for f in ./*.mp4; do vcs "$f" -U0 -dt -n 12 -c 4 -H 250 -A -o "${f%}.jpg"; done

### 'vcsi' is a LOT faster 
for f in ./*.mp4; do vcsi "$f" -g 5x4 -tT nw -w 1700 -f jpg; done
printf "\n\n======Moving thumbnails to screens directory======\n"
mkdir 1_screens
mv *.jpg 1_screens/
cd 1_screens
read -p "Press enter to continue" -t 5
ranger
