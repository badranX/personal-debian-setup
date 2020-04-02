# Bash files for me to set up  new machines!! DON'T USE


### Installing

1- Install nodejs and npm!. <br />

2- Run ./setup_packages.sh <List_of_Packages_to_Install>. Maybe you need to chmod! <br />

```
yes | sudo -H ./setup_packages.sh ./packages_requirements.txt 2> error.log
```
./setup_packages.sh will also create ./packages_mistakes.txt containing packages that failed to be installed.<br />

3- copy configuration files in ./file to their correct locations.<br />

```
yes | sudo -H ./setup_files.sh
```

4- In neovim, run :PlugInstall. <br />
5- Change PS1 variable in ~/.bashrc (check bashrc_append in ./file) <br />
