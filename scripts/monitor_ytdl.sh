#!/bin/bash

# Count files already downloaded
downloaded=$(ls $1 | wc -l)

# Count all URLs in the batch file
total=$(cat $1/x | wc -l)

# Calculate size of directory selected, 
# then remove the directory name from the line with `tr` 
printf 'Size in bytes: '; du -s $1 | tr "$1" " " 
printf 'Total files to download: '; printf "$total\n"

# Calculate files left to download
printf 'Files Left: '; expr $total \- $downloaded
