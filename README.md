# Bash files to setup my new machines!!


### Installing

Note: check ./setup_packages.sh for possible future changes in installing nodejs and nvim. They are not included in ./packages_requirements.txt but hard coded in the file.

1- Run ./setup_packages.sh <List_of_Packages_to_Install>. Maybe you need to chmod! <br />

```
yes | sudo -H ./setup_packages.sh ./packages_requirements.txt 2> error.log
```
./setup_packages.sh will also create ./packages_mistakes.txt containing packages that failed to be installed.<br />

2- copy configuration files in ./file to their correct locations.<br />

```
yes | sudo -H ./setup_files.sh
```

3- In neovim, run :PlugInstall. <br />
4- Change PS1 variable in ~/.bashrc (check bashrc_append in ./file) <br />
