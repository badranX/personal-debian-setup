#!/bin/bash

#If gnome-terminal window open, bring to foreground
#otherwise, open gnome-terminal
#REASON: ctrl+alt+t is annoying and creates a new terminal every time

SEARCH_RESULT=$(xdotool search --class gnome-terminal)

if [[ -z $SEARCH_RESULT ]]; then
	gnome-terminal & disown 
else
	xdotool search --class gnome-terminal windowactivate %@
fi


