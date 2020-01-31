#! /bin/bash
grim $(xdg-user-dir PICTURES)/$(date +'%Y-%m-%d-%H:%M:%S_grim.png')
notify-send Screenshot: $(xdg-user-dir PICTURES)/$(date +'%Y-%m-%d_%H:%M:%S_slurp.png') -t 10000
