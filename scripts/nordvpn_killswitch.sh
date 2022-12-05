#!/bin/bash

# Toggle killswitch
if nordvpn settings | grep "Kill Switch: enabled" > /dev/null
then
	nordvpn set autoconnect off > /dev/null
	nordvpn set killswitch off > /dev/null
else
	nordvpn set autoconnect on > /dev/null
	nordvpn set killswitch on > /dev/null
fi

/usr/bin/nordvpn status | /usr/bin/rg -i "status|country|uptime" > /tmp/vpn
/usr/bin/nordvpn settings | /usr/bin/rg -i "kill switch|auto-connect" >> /tmp/vpn
vpn_info=$(/usr/bin/cat /tmp/vpn | /usr/bin/sed -r '1s/^.{6}//')
/usr/bin/notify-send -t 5000 "$vpn_info"
