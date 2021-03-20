#!/bin/bash

# Updating repository from github
git pull

# Updating all submodules form github
git submodule update --init --recursive

# Geting all necessary libs for vim build
sudo apt-get --yes  install libncurses5-dev libgtk2.0-dev libatk1.0-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev

# Building Vim it selfe
isVIM=(`vim --version | grep "Compiled by machy*" | wc -l`) 

if [ $isVIM -eq 0 ]
	then
	cd ./vim/src
	make distclean
	./configure --with-features=huge
	make
	sudo make install
	cd ../..
fi

# Cleaning up
sudo apt-get --yes autoremove

# Linking .vim and .vimrc to their position
mkdir ~/.vim 2> /dev/null || rm -rf ~/.vim/*
ln -sr dotvim/* ~/.vim
ln -sr vimrc ~/.vimrc 2> /dev/null
