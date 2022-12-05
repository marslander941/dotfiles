#!/bin/bash

n=0 
for f in ./*.jpg; do 
	printf -v num %04d "$((++i))"
	mv -i "$f" "${1}_$num.jpg"
done
exit
