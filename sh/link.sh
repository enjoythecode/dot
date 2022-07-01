#!/bin/bash

ln -s ~/dot/vim/.vimrc ~/.vimrc
mkdir -p ~/.config/nvim
ln -s ~/dot/nvim/init.vim ~/.config/nvim/init.vim
echo "[ -f $HOME/dot/bash/entry.bashrc ] && source $HOME/dot/bash/entry.bashrc" >> ~/.bashrc
