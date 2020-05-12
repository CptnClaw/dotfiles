#!/bin/bash

VID=$1
OUTDIR="$HOME"/Videos/youtube/
OUTFORMAT="%(uploader)s - %(title)s.%(ext)s"
if youtube-dl -f "bestvideo[height<=?1080]+bestaudio/best" -o "$OUTDIR""$OUTFORMAT" "$VID"
then
	notify-send "finished downloading $VID!"
else
	notify-send -u critical "ERROR downloading $VID!"
	echo "$VID" >> "$OUTDIR"ERRORS
fi