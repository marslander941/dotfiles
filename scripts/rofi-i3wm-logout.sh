#!/bin/bash

# Logout script for use with rofi menu
res=$(rofi -dmenu < ~/.dmenu-i3exit)
if [ $res = "Logout" ]; then
    i3-msg exit
fi
if [ $res = "Restart" ]; then
    reboot
fi
if [ $res = "Shutdown" ]; then
    poweroff
fi
exit 0
