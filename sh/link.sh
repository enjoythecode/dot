#!/bin/bash

ln -s ~/dot/vim/.vimrc ~/.vimrc
echo "[ -f $HOME/dot/bash/entry.bashrc ] && source $HOME/dot/bash/entry.bashrc" >> ~/.bashrc
