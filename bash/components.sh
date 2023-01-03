function source_file_if_exists () {
    if [ -f $1 ]; then
        source $1
    fi
}

DOT_BASH=$HOME/dot/bash
for component in exports.sh aliases_and_functions.sh configuration.sh prompt.sh scripts/z.sh
do
	# https://codefather.tech/blog/bash-get-script-directory/
        SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
	source_file_if_exists $SCRIPT_DIR/$component
done

if [ -f ~/dot/sh/.git-completion.bash ]; then
  . ~/dot/sh/.git-completion.bash
fi

