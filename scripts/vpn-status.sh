#!/bin/bash

clear
export DISPLAY=:0
/usr/bin/nordvpn status | /usr/bin/rg -i "status|country|uptime" > /tmp/vpn
/usr/bin/nordvpn settings | /usr/bin/rg -i "kill switch|auto-connect" >> /tmp/vpn
vpn_info=$(/usr/bin/cat /tmp/vpn | /usr/bin/sed -r '1s/^.{6}//')
/usr/bin/notify-send -t 5000 "$vpn_info"
