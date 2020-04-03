#!/bin/bash

#If <Program> window open, bring to foreground
#otherwise, open <Program> 
#REASON: ctrl+alt+t is annoying and creates a new terminal every time. With this I can create many shortcuts

if [ $# -eq 0 ]; then
	echo "you should provide a program name"
else
	Program=$@
	SEARCH_RESULT=$(xdotool search --class "$Program")

	if [[ -z $SEARCH_RESULT ]]; then
		eval "$Program" & disown 
	else
		xdotool search --class "$Program" windowactivate %@
	fi

fi
