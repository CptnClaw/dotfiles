#!/bin/bash

VID=$1
OUTDIR="$HOME"/Videos/youtube/
OUTFORMAT="%(uploader)s - %(title)s (%(duration)ss).%(ext)s"

notify-send "downloading $VID..."
if youtube-dl -f "bestvideo[ext=mp4][height<=?1080]+bestaudio[ext=m4a]/mp4" --audio-format aac --merge-output-format mp4 -o "$OUTDIR""$OUTFORMAT" "$VID"
then
	notify-send "finished downloading $VID!"
else
	notify-send -u critical "ERROR downloading $VID!"
	echo "$VID" >> "$OUTDIR"ERRORS
fi
