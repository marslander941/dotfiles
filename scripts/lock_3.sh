#!/bin/bash

#picnoblur=$PIC
#picwithblur=$HOME/.lock.png

#convert -blur 0x10 -type grayscale
#convert -scale 4% -scale 2500% 
#-blur 0x1 -type grayscale 
#convert -scale '2.5%' -scale '4000%' \
#-blur 0x3 \
#convert -scale 10% -scale 1000% \

PIC=/tmp/pic.png

scrot -F $PIC && \
	convert $PIC \
	-scale 5% -scale 2000% \
	$PIC && \
	i3lock -ui $PIC 

#convert screenshot.png lock.png -gravity center -composite screenshot.png 

rm $PIC

