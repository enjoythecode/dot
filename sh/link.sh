#!/bin/bash

ln -s ~/dot/nvim ~/.config/
echo "[ -f $HOME/dot/bash/entry.bashrc ] && source $HOME/dot/bash/entry.bashrc" >> ~/.bashrc
