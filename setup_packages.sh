#!/bin/bash

LOGS="./packages_mistakes.log"

#print error message to LOGS
iserror() {
	if [ $? -ne 0 ]; then
		echo "$1" |  tee -a LOGS
	fi
}

apt-get update

rm -f LOGS

while IFS= read -r line; do
	apt-get -y install  $line
	iserror "$line"
done < "$1"

#Python requirments
#Jupyterlab requirements
pip3 install -r ./requirements.txt
if [ $? -ne 0 ]; then
	echo "badranx error: mistake installing python requirements"
else
	jupyter labextension install jupyterlab_vim

	iserror "jubyterlab_vim (plugin)"
fi

#install nodjes as sugested by coc-vim
curl -sL install-node.now.sh/lts | bash
iserror "install nodejs"
