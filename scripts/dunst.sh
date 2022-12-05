#!/bin/bash
if pgrep -x dunst > /dev/null
then
    killall dunst
    dunst &
else
    dunst &
fi

