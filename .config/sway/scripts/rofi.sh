#!/bin/bash
echo Óklárað skript
rofi -m $(expr $(swaymsg -t get_tree | jq '.nodes | map([recurse(.nodes[]?, .floating_nodes[]?) | .focused] | any) | index(true)') - 1) -show drun 
