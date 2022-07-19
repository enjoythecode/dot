#!/bin/bash

ln -s ~/dot/nvim ~/.config/
ln -s ~/dot/sinany/docs/HOME.README.md ~/README.md
ln -s ~/dot/sinany/docs/HOME.TODO.md ~/TODO.md
echo "[ -f $HOME/dot/bash/entry.bashrc ] && source $HOME/dot/bash/entry.bashrc" >> ~/.bashrc

# on OSX, bash does not read ~/.bashrc by default, but it does read ~/.profile
if [[ "$OSTYPE" == "darwin"* ]]; then
	ln -s ~/.bashrc ~/.profile
fi
