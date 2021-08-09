#!/bin/bash

FILE=".config/i3/config"
sed -n '/START_KEYS/,/END_KEYS/p' "$FILE" | \
	grep bindsym | \
	grep -v ^# | \
	sort | \
	sed 's/bindsym //' | \
	#column -t -o 'exec' | \
	sed 's/ exec /:/' | \
	column -t -s ':'   | \
	gxmessage -buttons "" -file - -font "mono 16" -borderless