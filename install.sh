#!/bin/bash

# Updating repository from github
git pull

# Updating all submodules form github
git submodule update --init --recursive

# Geting all necessary libs for vim build
sudo apt-get --yes  install libncurses5-dev libgtk2.0-dev libatk1.0-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev universal-ctags python3 npm openjdk-11-jre-headless
sudo snap install go --classic
sudo npm install -g npm

# Building Vim it selfe
isVIM=(`vim --version | grep "Compiled by machy*" | wc -l`) 

if [ $isVIM -eq 0 ]
	then
	cd ./vim/src
	make distclean
	./configure --with-features=huge --with-python3-command=python3.8 \
                --with-python3-config-dir=/usr/lib/python3.8/config-3.8-x86_64-linux-gnu \
                --enable-python3interp
	make
	sudo make install
	cd ../..
fi

# Cleaning up
sudo apt-get --yes autoremove
curl -fLo ./dotvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Linking .vim and .vimrc to their position
mkdir ~/.vim 2> /dev/null || rm -rf ~/.vim/*
ln -sr dotvim/* ~/.vim
ln -sr vimrc ~/.vimrc 2> /dev/null

vim +'PlugInstall --sync' +qa

cd dotvim/plugged/YouCompleteMe/
git submodule update --init --recursive
cd ../../../

~/.vim/plugged/YouCompleteMe/install.py --all


