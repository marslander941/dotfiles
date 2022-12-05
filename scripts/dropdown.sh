#!/bin/bash

if pgrep kitty; then
	pkill kitty
	kitty --class=dropdown &
else
	kitty --class=dropdown &
fi
