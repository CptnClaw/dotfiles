#!/bin/bash
export PSXDIR=$HOME/Games/ROMS/PS1
if [ -z $1 ];
        then
        echo "ERROR: Invalid usage."
        echo "  Usage: rip-ps1.sh [filename]"
        echo "  where filename is the desired name, minus extensions."
fi
cdrdao read-cd --read-raw --datafile $PSXDIR/$1.bin --device /dev/sr0 --driver generic-mmc-raw $PSXDIR/$1.toc
toc2cue $PSXDIR/$1.toc $PSXDIR/$1.cue

# Subchannel (copy protection) --read-subchan rw_raw

# bchunk $1.bin $1.cue $1.iso
