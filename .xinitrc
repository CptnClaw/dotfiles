#!/bin/bash
[[ -f ~/.xprofile ]] && source ~/.xprofile
setxkbmap -option caps:swapescape
exec i3
