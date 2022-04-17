#!/bin/sh 
layout=$(i3-msg -t get_tree | jq -r '[recurse(.nodes[])] | .[] | select(.nodes[].focused).layout')
if [ $layout = "splitv" ] 
then
	echo ""
elif [ $layout = "splith" ] 
then
	echo ""
fi
