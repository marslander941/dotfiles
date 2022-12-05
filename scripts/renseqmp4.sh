#!/bin/bash

#read -p "Enter desired file name: " string
n=0 
for f in ./*.mp4; do 
	printf -v num %04d "$((++i))"
	mv -i "$f" "${1}_$num.mp4"
done
exit
