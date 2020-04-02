#!/bin/bash
LOGS="./files_mistakes.log"
MyName="badranx"
NVIM="$HOME/.config/nvim"
RedShift="$HOME/.config/redshift"
APPEND_TO_BASHRC="bashrc_append"

#print error message to LOGS
iserror() {
	if [ $? -ne 0 ]; then
		echo "$1" |  tee -a $LOGS
	else
		echo "successfully copied $1"
	fi
}

#a code that append changes to the variable PS1 that affects the terminal prompt
##check if .bashrc contain "badranx"
#if [ ! $(grep -Fxq "$MyName" "$HOME/.bashrc") ]
#then
#	cat "./file/$APPEND_TO_BASHRC" | tee -a "$HOME/.bashrc"
#fi

cp -f file/.tmux.conf "$HOME"
iserror ".tmux.conf"
mkdir -p $NVIM && cp -f  "./file/init.vim" $NVIM
iserror "$NVIM/.init.vim"
mkdir -p $RedShift && cp -f "./file/redshift.conf" $RedShift
iserror "$RedShift/.redshift.conf"
