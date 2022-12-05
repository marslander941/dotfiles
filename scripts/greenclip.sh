#!/bin/bash

if pgrep -x greenclip > /dev/null
then
    killall greenclip && greenclip clear
	greenclip daemon &
else
    greenclip daemon &
fi

