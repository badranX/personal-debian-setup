#!/bin/bash
#assume you already downloaded nodejs
REQUIREMENT_FILE="./packages_requirements.txt"
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
	#The following line was needed for installing matplotlib!
	#[[ $line = *"build-dep" ]] && PACKAGE_MANAGER_CMD="apt-get build-dep -yf install"
	$PACKAGE_MANAGER_CMD  $line
	iserror "$line"
done < "$REQUIREMENT_FILE"

#<<<after this line, packages should be checked for updates or a better instalation method

#Commented installing nodejs!!! You should install it by yourself
#install nodejs and npm
curl -sL "https://deb.nodesource.com/setup_10.x" | bash -
iserror "badranx error: problem while curl nodejs"
apt-get install -y nodejs 
#apperantly npm is included
iserror "badranx error: problem while installing nodejs and npm"

#Python requirments
#Jupyterlab requirements
$PIP3_CMD  $PIP_REQUIREMENTS
if [ $? -ne 0 ]; then
	echo >&2 "badranx error: mistake installing python requirements"
else
	#the following plugin needs npm. TODO:maybe prevent trying if !npm
	jupyter labextension install jupyterlab_vim

	iserror "badranx error: problem installing jubyterlab_vim (plugin)"
fi

#install neovim
add-apt-repository ppa:neovim-ppa/unstable
iserror "BadranX: problem with PPA:neovim"
apt-get update
apt-get install neovim
iserror "BadranX: problem with installing neovim"

#exit sudo!
sudo -K
#neovim Plugin manager (Vim-Plug)
curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
iserror "BadranX: prolem with installing Vim-Plug for neovim"

