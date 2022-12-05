#!/bin/bash
# Extract 7z files
for f in `ls *.7z`; do
	mkdir "$f"_dir
	7za e -y $f -o "$f"_dir/
