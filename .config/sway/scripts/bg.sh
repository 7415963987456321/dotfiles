#!/bin/bash
pkill -x "glpaper"
bg=$(find ~/.config/sway/bg -iname '*.jpg' -print0 | shuf -z -n1)
wal -e -q -n -i $bg --backend colorz
swaymsg output "*" background $bg stretch
