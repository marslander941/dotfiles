#!/bin/bash

mullvad auto-connect set on >/dev/null
mullvad always-require-vpn set on >/dev/null
mullvad connect >/dev/null

var=$(mullvad status | grep -o Atlanta)

# Toggle VPN between 2 servers
if [ $var = 'Atlanta' ] 2>/dev/null
then
	timeout 5s mullvad relay set location us LOCATION >/dev/null
else
	timeout 5s mullvad relay set location us LOCATION >/dev/null
fi

sleep 1

# Set variable
city=$(mullvad status | awk {'print $5'} | tr ',' ' ')
# Send notification with 'dunst'
notify-send -t 3000 "Current city $city"

