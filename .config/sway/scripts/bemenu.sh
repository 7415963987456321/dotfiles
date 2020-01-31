#!/bin/bash
if pgrep -x "bemenu-run" >/dev/null
then 
	pkill -x "bemenu-run"
	exit 0
else
	echo "launching bemenu"
	bemenu-run -i -p 'exec'
fi
