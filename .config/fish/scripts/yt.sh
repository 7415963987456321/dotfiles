#!/bin/bash
if [[ -z $1 ]]; then
    while [ -z ${url} ]; do
    echo "Paste URL:"
        read url
    done

    printf "Mode: \n \
    Fullscreen:(fs | fullscreen) \n \
    Audio:(a | audio) \n \
    Overlay:(default) \n"
    read mode

else
    url="$1"
    mode="$2"
fi

case "$mode" in
    fs | fullscreen)
        echo "Playing fullscreen"
        mpv $url --no-border -fs &> /dev/null 2>&1 &
        ;;
    a | audio)
        echo "Playing audio only"
        mpv $url --vid=no
        ;;
    *)
        echo "Playing on overlay"
        # mpv $url --ontop --no-border --autofit=30% --geometry=100%:100%
        mpv $url --ontop --no-border --autofit=30% --geometry=100%:100% &> /dev/null 2>&1 &
        ;;
esac
