#!/bin/bash
pkill -x "swaybg|glpaper"
bg=$(find ~/.config/sway/glpaper -iname '*.frag' -print0 | shuf -z -n1)
glpaper eDP-1 $bg

