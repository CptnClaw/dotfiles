#!/bin/bash

FILE=".config/i3/config"
START=$(grep "# applications" -n $FILE | cut -d ":" -f 1)
END=$(grep "# media" -n $FILE | cut -d ":" -f 1)
RANGE="$START","$END""p"
sed -n $RANGE "$FILE" | grep bindsym | grep -v ^# | \
	gxmessage -buttons "" -file - -font "mono 16" -borderless