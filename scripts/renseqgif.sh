#!/bin/bash

n=0 
for f in ./*.gif; do 
	printf -v num %04d "$((++i))"
	mv -i "$f" "${1}_$num.gif"
done
exit

