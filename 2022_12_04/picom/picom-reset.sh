#!/bin/bash
if pgrep -x picom > /dev/null
then
    killall picom
    #picom --experimental-backends
	picom --vsync --backend glx &
else
	picom --vsync --backend glx &
fi
