#!/bin/bash

ln -s ~/dot/nvim ~/.config/
ln -s ~/dot/sinany/docs/HOME.README.md ~/README.md
echo "[ -f $HOME/dot/bash/entry.bashrc ] && source $HOME/dot/bash/entry.bashrc" >> ~/.bashrc
