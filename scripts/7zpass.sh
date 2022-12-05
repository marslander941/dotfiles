#!/bin/bash
# Extract 7z files with password
read -p "Enter password: " pw
7za x "*.7z" -p$pw
