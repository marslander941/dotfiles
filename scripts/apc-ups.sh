#!/bin/bash
# Show notification with UPS info
# Requires 'apcupsd' package

clear
apcaccess | rg "LOADPCT|BCHARGE|TIMELEFT|CUMONBATT|TONBATT" > /tmp/apc
cat /tmp/apc
notify-send -t 5000 "$(cat /tmp/apc)"
