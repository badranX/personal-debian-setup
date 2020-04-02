#!/bin/bash
#assume you already downloaded nodejs
PACKAGE_MANAGER_CMD="apt-get -yf install"
PIP3_CMD="pip3 install -Ur"
LOGS="./packages_mistakes.log"
PIP_REQUIREMENTS="./pip_requirements.txt"
#for MatplotLib, After this Matplotlib will install the required FreeType on its own
MPLLOCALFREETYPE=1
#print error message to LOGS
iserror() {
	if [ $? -ne 0 ]; then
		echo "$1" >&2 |  tee -a $LOGS
	fi
}

apt-get update

rm -f $LOGS

while IFS= read -r line; do
	[[ $line = \#* ]] && continue
	[[ $line = *"build-dep" ]] && PACKAGE_MANAGER_CMD="apt-get build-dep -yf install"
	$PACKAGE_MANAGER_CMD  $line
	iserror "$line"
done < "$1"

#Python requirments
#Jupyterlab requirements
$PIP3_CMD  $PIP_REQUIREMENTS
if [ $? -ne 0 ]; then
	echo "badranx error: mistake installing python requirements"
else
	
	#the following plugin needs npm
	jupyter labextension install jupyterlab_vim

	iserror "jubyterlab_vim (plugin)"
fi

#install neovim
add-apt-repository ppa:neovim-ppa/unstable
iserror("BadranX: problem with PPA:neovim")
apt-get update
apt-get install neovim
iserror("BadranX: problem with installing neovim")
#neovim Plugin manager (Vim-Plug)
curl "-fLo" "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
iserror("BadranX: prolem with installing Vim-Plug for neovim")

