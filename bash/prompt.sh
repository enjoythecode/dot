set_prompt () {
    Last_Command=$? # Must come first!
    Blue='\[\e[01;34m\]'
    White='\[\e[01;37m\]'
    Red='\[\e[01;31m\]'
    Green='\[\e[01;32m\]'
    Reset='\[\e[00m\]'
    FancyX='\342\234\227'
    Checkmark='\342\234\223'

	PS1=""

    # If it was successful, print a green check mark. Otherwise, print
    # a red X.
    if [[ $Last_Command == 0 ]]; then
        PS1+="$Green$Checkmark "
    else
        PS1+="$Red$FancyX "
    fi

    # If root, just print the host in red. Otherwise, print the current user
    # and host in green.
    if [[ $EUID == 0 ]]; then
        PS1+="$Red\\u$Green@\\h "
    else
        PS1+="$Green\\u@\\h "
    fi

    # Print the working directory and prompt marker in blue
    PS1+="$Blue\\w "

	# Print the git branch, if exists, in white
	branch=$(git branch --show-current 2>/dev/null)
	if [[ -n $branch ]]; then
		PS1+="$White $branch "
	fi

	# Reset the text color to the default.
	PS1+="$Blue\\\$$Reset "

}

PROMPT_COMMAND='set_prompt'

