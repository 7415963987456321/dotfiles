#! /bin/bash
slurp | grim -g - $(xdg-user-dir PICTURES)/$(date +'%Y-%m-%d_%H:%M:%S_slurp.png')
notify-send Screenshot: $(xdg-user-dir PICTURES)/$(date +'%Y-%m-%d_%H:%M:%S_slurp.png') -t 10000
