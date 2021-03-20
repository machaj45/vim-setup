#!/bin/sh
git submodule update --init --recursive
sudo apt-get --yes  install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev
cd ./vim/src
make distclean
./configure --with-features=huge
make
sudo make install
cd ..
