#!/bin/bash

clear
echo 'Processing request...'
for f in *; do
    num=`expr match "$f" '[^0-9]*\([0-9]\+\).*'`
    padded=`printf "%04d" $num`
    newname=`echo $f | sed "s/${num}/${padded}/"`
    mv -n $f $newname
done
echo 'Added padding of zeroes to file names.\n'
