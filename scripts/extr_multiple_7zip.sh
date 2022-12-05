#!/bin/bash

for file in *.7z
do
    7z x -o"`basename \"$file\" .7z`" "$file"
done
