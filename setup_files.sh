#!/bin/bash
LOGS="./files_mistakes.log"
MyName="badranx"
NVIM="$HOME/.config/nvim/"
RedShift="$HOME/.config/redshift"
BASHRC_APPEND="bashrc_append"

#print error message to LOGS
iserror() {
	if [ $? -ne 0 ]; then
		echo "$1" |  tee -a LOGS
	fi
}

if grep -Fxq "$MyName" my_list.txt
then
	cat file/"BASHRC_APPEND" | tee -a "$HOME/.bashrc"
fi

cp -f file/.tmux.conf "$HOME"
iserror ".tmux.conf"
mkdir -p $NVIM && cp -f  file/.init.vim $NVIM
iserror "$NVIM/.init.vim"
mkdir -p $RedShift && cp -f file/.redshift.conf $RedShift
iserror "$RedShift/.redshift.conf"
