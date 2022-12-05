#!/bin/bash
 
PIC='/tmp/screen.png'

scrot $PIC && \
	convert $PIC \
	-scale 5% -scale 2000% \
	-blur 0x10 $PIC

LOCK_ICON='/home/marslander/scripts/icons/lock.png'

if [[ -f $LOCK_ICON ]]
then
    # placement x/y
    PX=0
    PY=0
    # lockscreen image info
    R=$(file $LOCK_ICON | grep -o '[0-9]* x [0-9]*')
    RX=$(echo $R | cut -d' ' -f 1)
    RY=$(echo $R | cut -d' ' -f 3)
 
    SR=$(xrandr --query | grep ' connected' | cut -f3 -d' ')
    for RES in $SR
    do
        # monitor position/offset
		
        SRX=$(echo $RES | cut -d'x' -f 1)                   # x pos
        SRY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 1)  # y pos
        SROX=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 2) # x offset
        SROY=$(echo $RES | cut -d'x' -f 2 | cut -d'+' -f 3) # y offset
        PX=$(($SROX + $SRX/2 - $RX/2))
        PY=$(($SROY + $SRY/2 - $RY/2))
 
        convert $PIC $LOCK_ICON \
			-geometry +$PX+$PY \
			-composite -matte $PIC
        
#		scrot -F $PIC && \
#			convert -scale 5% -scale 2000% \
#			$PIC $PIC && \
#			i3lock -i $PIC
#		rm $PIC

    done
fi

i3lock -e -u -i $PIC


