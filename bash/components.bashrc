function source_file_if_exists () {
    if [ -f $1 ]; then
        echo "sourcing $1"
        source $1
    else
        echo "could not source $1 because it doesn't exist"
    fi
}

DOT_BASH=$HOME/dot/bash
for component in exports.bashrc aliases_and_functions.bashrc configuration.bashrc
do
    source_file_if_exists $DOT_BASH/$component
done
