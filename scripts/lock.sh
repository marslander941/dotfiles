#!/bin/bash

LOCKPNG='/home/marslander/obsidian/scripts/.lock.png'
PIC=/home/marslander/.lock.png

#convert $PIC \
#-scale 10% -scale 1000% $PIC
#
convert $PIC $LOCKPNG -gravity center -composite $PIC

i3lock -ti $PIC
