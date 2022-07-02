function source_file_if_exists () {
    if [ -f $1 ]; then
        source $1
    fi
}

DOT_BASH=$HOME/dot/bash
for component in exports.bashrc aliases_and_functions.bashrc configuration.bashrc
do
    source_file_if_exists $DOT_BASH/$component
done

