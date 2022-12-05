#!/bin/bash

# convert any image from $WALL and set as wallpaper with 'feh'
# requires pkg 'imagemagick'

WALL='/run/media/$USER/1_int/wallpapers/artstation/alena-aenami'

for file in `\ls $WALL`;
do
	cd $WALL
	sleep 2
	convert -resize 1920 "$file" /home/$USER/.wall.png && \
		feh --bg-scale /home/$USER/.wall.png && \
		rm /home/$USER/.wall.png
done

