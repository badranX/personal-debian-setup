#!/bin/bash
echo "Careful: HOME env variable = ${HOME}"
LOGS="./files_mistakes.log"
MyName="badranx"
NVIM="${HOME}/.config/nvim"
RedShift="${HOME}/.config/redshift"
USR_BIN= "/usr/bin"
#The following method of appending to .bashrc was abandoned
APPEND_TO_BASHRC="bashrc_append"

#if error it will print $1, otherwise print success
iserror() {
	if [ $? -ne 0 ]; then
		echo "$1" >&2 |  tee -a "$LOGS"
	else
		echo "successfully copied $1"
	fi
}

if [[ -z  "${HOME}" ]]; then

	echo "badranx error: HOME env variable is empty!" >&2

else


	#print error message to LOGS

	#a code that append changes to the variable PS1 that affects the terminal prompt
	##check if .bashrc contain "badranx"
	#if [ ! $(grep -Fxq "$MyName" "$HOME/.bashrc") ]
	#then
	#	cat "./file/$APPEND_TO_BASHRC" | tee -a "$HOME/.bashrc"
	#fi

	cp -f "./file/.tmux.conf" "$HOME"
	iserror "${HOME}/.tmux.con"
	mkdir -p "$NVIM" && cp -f  "./file/init.vim" "$NVIM"
	iserror "$NVIM/.init.vim"

	mkdir -p "$RedShift" && cp -f "./file/redshift.conf" "$RedShift"
	iserror "${RedShift}/.redshift.conf"

	#create command to move terminal on top (create a keybindings!)
	chmod +x "./extra/topterminal.me.sh"
	cp -f "./extra/topterminal.me.sh" "$USR_BIN"

fi
