if command -v nvim &> /dev/null
then
    export EDITOR="nvim"
else
    export EDITOR="vim"
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.7/bin # eventually obsolete
export PATH=$PATH:/usr/local/share/dotnet # what is this?
export PATH=$PATH:/Users/sinany/bin
export PATH=$PATH:~/apache/apache-maven-3.8.5/bin # apache should probably not be in ~, but who am i to say?

export CUSTOM_BASHRC_SOURCED="true"
