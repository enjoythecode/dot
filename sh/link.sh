#!/bin/bash

source ~/dot/bash/exports.sh

echo "$S_PATH_HOME"

ln -s ~/dot/nvim ~/.config/
ln -s ~/dot/sinany/docs/HOME.README.md ~/README.md
ln -s ~/dot/sinany/docs/HOME.TODO.md ~/TODO.md
echo "[ -f ~/dot/bash/entry.sh ] && source ~/dot/bash/entry.sh" >> ~/.bashrc

# on OSX, bash does not read ~/.bashrc by default, but it does read ~/.profile
if [[ "$OSTYPE" == "darwin"* ]]; then
	ln -s ~/.bashrc ~/.profile
fi
