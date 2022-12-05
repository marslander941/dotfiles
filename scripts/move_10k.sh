#!/bin/zsh

# Move 10K files from current dir to a numbered parent dir

for i in {1..15}; do
    mkdir ../_$i
    mv -- *([1,10000]) ../_$i
done
