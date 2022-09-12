if command -v nvim &> /dev/null
then
    export EDITOR="nvim"
else
    export EDITOR="vim"
fi

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

export PATH="$PATH:/Library/Frameworks/Python.framework/Versions/3.7/bin" #eventually obsolete
export PATH="$PATH:/usr/local/share/dotnet" # what is this?
export PATH="$PATH:/Users/sinany/bin"
export PATH="$PATH:~/apache/apache-maven-3.8.5/bin" # apache should probably not be in ~, but who am i to say?

export CUSTOM_BASHRC_SOURCED="true"

# Check if we are running in WSL under Windows, in which case we have a specific "Home" where S/ etc. are stored,
# separate from "Home" as in tilda (~)
# Source: https://stackoverflow.com/questions/60922620/shell-script-to-check-if-running-in-windows-when-using-wsl
if [ $(uname -r | sed -n 's/.*\( *Microsoft *\).*/\1/ip') ];
then
	export S_PATH_HOME="/mnt/c/Users/sinan/"
else
	export S_PATH_HOME="$HOME"
fi

# Paths that derive from "Home", wherever that is
export S_PATH_S="$S_PATH_HOME/S"
export S_PATH_BEANS="$S_PATH_HOME/S/beans"
export S_PATH_ARCHIVE="$S_PATH_HOME/S/Archive"
export S_PATH_TOSORT="$S_PATH_HOME/S/Archive/ToSort"
export S_PATH_BASHRC="$S_PATH_HOME/.bashrc"
export S_PATH_CURRENT="$S_PATH_HOME/S/Current"
export S_PATH_DOT="$S_PATH_HOME/dot"

# Paths that derive from the above (ie, indirectly dependent on "Home")
export S_PATH_WIKI="$S_PATH_S/Zettelkasten"
export S_PATH_VIMRC="$S_PATH_DOT/nvim/init.vim"
export S_PATH_BASH_ALIASES="$S_PATH_DOT/bash/aliases_and_functions.sh"
