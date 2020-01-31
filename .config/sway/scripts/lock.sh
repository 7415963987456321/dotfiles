#!/bin/bash
tmpbg='/tmp/screen.png'
icon='/home/keli/.config/sway/icon.png'

grim -o eDP-1 $tmpbg
convert $tmpbg -scale 10% -scale 1000% $tmpbg
#convert -scale 10% -blur 0x2.5 -resize 1000% $tmpbg $tmpbg
convert $tmpbg $icon -gravity center -composite -matte $tmpbg
swaylock -f -i $tmpbg
rm $tmpbg

