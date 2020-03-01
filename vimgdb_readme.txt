#!/bin/sh

#download
wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
wget https://codeload.github.com/larrupingpig/vimgdb-for-vim7.4/zip/master

tar jxvf vim-7.4.tar.bz2
unzip vimgdb-for-vim7.4-master.zip
patch -p0 < vimgdb-for-vim7.4-master/vim74.patch

# remove old vim
sudo apt-get remove vim vim-runtime gvim
sudo apt-get remove vim-tiny vim-common vim-gui-common

sudo apt-get build-dep vim

# manual complile depency soft package
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial

# configure,complile,install
cd vim74/src
./configure --enable-gdb --prefix=/usr --enable-multibyte --enable-fontset --enable-xim --enable-gui=auto --enable-pythoninterp=dynamic --enable-pythoninterp --enable-python3interp=dynamic --enable-rubyinterp=dynamic --enable-rubyinterp --enable-perlinterp --enable-cscope --enable-sniff --with-x --with-features=huge --enable-luainterp=dynami
# Note: edit /vim74/src/Makefile 
# comment 3 lines.
#BINDIR   = /opt/bin
#MANDIR   = /opt/share/man
#DATADIR  = /opt/share

# Bug: not find ruby/config.h
sudo make CFLAGS="-O2 -D_FORTIFY_SOURCE=1 -I /usr/include/x86_64-linux-gnu/ruby-2.3.0/"
sudo make install

# [ESC :set runtimepath?]
echo 'export PATH="/usr/share/vim/vim74:$PATH"' >> /etc/profile
source /etc/profile

# configure vimgdb
cp -rf vimgdb-for-vim7.4-master/vimgdb_runtime/* /usr/share/vim/vim74/
cd /usr/share/vim/vim74/doc
# sh vim
# [ESC :helptags .]
# [ESC :help vimgdb]

# Note
# F7 Toggle gdb mode
# Blankspace run gdb common
# [ESC :map]
# 1. blankspace $gdb file execute
# 2. <C-B> break pont 
# 3. <C-E> delete break point
# 4. run < input.txt (if need input like scanf, fgets)

# [ESC :ls] can see gdb-variables window
# blankspace $gdb createvar varname, add varname to gdb-variables.
# [ESC :h bel] get split methord:
# bel 20vs gdb-variables

