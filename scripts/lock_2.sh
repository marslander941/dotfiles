#!/bin/bash

#picnoblur=$PIC
#picwithblur=$HOME/.lock.png

#convert -blur 0x10 -type grayscale
#convert -scale 4% -scale 2500% 
#-blur 0x1 -type grayscale 
#-blur 0x3 \
#convert $PIC -blur 0x5 $PIC

PIC=/home/marslander/.lock.png
rm $PIC
scrot $PIC
convert -scale '2.5%' -scale '4000%' \
	-blur 0x5 -type grayscale $PIC $PIC

LOCKICON=/home/marslander/scripts/.lock.png
PIC_BLURRED=/home/marslander/.lock_blurred.png

#convert $PIC $LOCKICON -gravity center -composite $PIC
i3lock -tui $PIC
