#!/bin/bash

source ~/dot/bash/exports.sh

echo "$S_PATH_HOME"

ln -s "$S_PATH_DOT/nvim" ~/.config/
# TODO: parametrize the location of dot in the following line also (ie
# $S_PATH_DOT)
echo [ -f ~/dot/bash/entry.sh ] && source ~/dot/bash/entry.sh >> ~/.bashrc

# on OSX, bash does not read ~/.bashrc by default, but it does read ~/.profile
if [[ "$OSTYPE" == "darwin"* ]]; then
	ln -s ~/.bashrc ~/.profile
fi
