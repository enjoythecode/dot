function source_file_if_exists () {
    if [ -f $1 ]; then
        source $1
    fi
}

DOT_BASH=$HOME/dot/bash
for component in exports.sh aliases_and_functions.sh configuration.sh prompt.sh scripts/z.sh
do
    source_file_if_exists $DOT_BASH/$component
done

if [ -f ~/dot/sh/.git-completion.bash ]; then
  . ~/dot/sh/.git-completion.bash
fi

