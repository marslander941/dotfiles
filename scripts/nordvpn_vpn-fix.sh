#!/bin/bash

clear
timeout 5s nordvpn set killswitch disabled 
timeout 5s nordvpn set autoconnect disabled
timeout 5s nordvpn disconnect
timeout 5s nordvpn set autoconnect enabled
timeout 5s nordvpn set killswitch enabled
timeout 20s nordvpn connect us

nordvpn status | rg -i "status|country|uptime" > /tmp/vpn
nordvpn settings | rg -i "kill switch|auto-connect" >> /tmp/vpn
vpn_info=$(cat /tmp/vpn | sed -r '1s/^.{6}//')
notify-send -u critical "$vpn_info"
