# Common 1-ers
alias l="ls -lah" # -l=show extended; -a=show hidden; -h=format sizes humanly
function ls_show_largest_first () {
    # use awk to get rid of the first two lines
    # first line is "total <item_count>"
    # second line is the ls line for ".." (since that is bound to be the largest)
    ls -lahS | awk 'NR > 2' # -S; sort by file size
}
export -f ls_show_largest_first
alias largest="ls_show_largest_first"

alias d="cd"
alias s="git status" # left middle finger on Colemak
alias c="clear"
alias mv="mv -i" # confirm before overwriting, silently works otherwise
alias o="open"

# "G"it
alias g="git" # for custom commands
alias gs="git status"
alias ga="git add "
alias gb="git branch "
alias all="gall"
alias gall="git add ."
alias gap="git add --patch"
alias gallop="git add --patch ."
alias g2="git push" # git "to"
alias g2f="git push --force" # git "to" --force
alias g4="git pull" # git "from"
alias gm="git checkout master >/dev/null 2>&1 || git checkout main" # if the "m" (default/main) branch is not master but main, handle that too
alias gcm="git commit -m "
alias gca="git commit --amend"
alias gd="git diff "
alias gds="git diff --staged "
alias grv="git remote -v"
alias gc="git checkout "
alias dog="git log --all --decorate --oneline --graph" # https://stackoverflow.com/a/35075021
alias gl="git log --all --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset) %C(bold cyan)(committed: %cD)%C(reset) %C(auto)%d%C(reset)%n''          %C(white)%s%C(reset)%n''          %C(dim white)- %an <%ae> %C(reset) %C(dim white)(committer: %cn <%ce>)%C(reset)'"
function git_add_all_commit () {
    git status
    git add .
    git commit
}
export -f git_add_all_commit
alias gac="git_add_all_commit"

# "M"ake
alias m="make"
alias mb="make build"
alias mt="make test"

# "S"ource
alias sv=". venv/bin/activate"
alias sb=". ~/dot/bash/components.sh"

# "E"dit
alias e="$EDITOR"
alias eb="$EDITOR $S_PATH_BASHRC"
alias eba="$EDITOR $S_PATH_BASH_ALIASES"
alias ebe="$EDITOR ~/dot/bash/exports.sh"
alias ebp="$EDITOR ~/dot/bash/prompt.sh"
alias ebcfg="$EDITOR ~/dot/bash/configuration.sh"
alias ebc="$EDITOR ~/dot/bash/components.sh"
alias ev="$EDITOR $S_PATH_VIMRC"
alias r="$EDITOR ./README.md"
alias t="$EDITOR ./TODO.md"
alias th="$EDITOR ~/TODO.md"
alias k="cd $S_PATH_WIKI && $EDITOR"
alias size="du -hs * | sort -rh"

# One letter shortcuts for z.sh
alias za="z a"
alias zb="z b"
alias zc="z c"
alias zd="z d"
alias ze="z e"
alias zf="z f"
alias zg="z g"
alias zh="z h"
alias zi="z i"
alias zj="z j"
alias zk="z k"
alias zl="z l"
alias zm="z m"
alias zn="z n"
alias zo="z o"
alias zp="z p"
alias zq="z q"
alias zr="z r"
alias zs="z s"
alias zt="z t"
alias zu="z u"
alias zv="z v"
alias zw="z w"
alias zx="z x"
alias zy="z y"
alias zz="z z"

# Functions

function list_available_functions () {
    declare -Fx | awk 'sub("declare -fx ", "")'
}
export -f list_available_functions

function list_available_aliases () {
    alias | awk 'sub("alias ", "")'
}
export -f list_available_aliases

function list_aliases_and_functions () {
	{ list_available_aliases ; list_available_functions ; }
}
export -f list_aliases_and_functions

# pressing `p` drops user into fzf of available functions and aliases. selecting
# one executes it. preview of the function is provided through explain_how_function_works
function fzf_aliases_functions_and_execute_it () {
	list_aliases_and_functions | fzf --preview="explain_how_function_works {}" | cut -d"=" -f1 | xargs -I {} bash -c -i '{}'
}
export -f fzf_aliases_functions_and_execute_it
alias p="fzf_aliases_functions_and_execute_it"

function profile_nvim_startup_time () {
    nvim --startuptime /dev/stdout +qall
}
export -f profile_nvim_startup_time

# this is the idea for a function that I have
# the idea is that given a query, it will find a relevant
# result from my bash configuration (or other resources, such
# as a collection of bash tricks, etc.) and let me know in a
# way that feels magical to me.
# Currently, it just can handle functions and aliases through "type"
function explain_how_function_works () {
    function how_core () {
        type $1
    }
    if [ -z $1 ]; then
        how_core  $(list_available_functions | fzf)
    else
		# if this is an alias listing, only give the part before the alias to how_core
		if [[ $1 == *"="* ]]; then
			how_core $(echo $1 | cut -d"=" -f1)
		else
			how_core $1
		fi
    fi

}
export -f explain_how_function_works
alias how="explain_how_function_works"

# if $1 is a string, find its location and open it with editor
# if not, drop the user to a fzf of available functions, and then
# call self with the selection
function go_to_definition_of_function () {
    function go_to_definition_of_function_core () {
        file=~/dot/bash/aliases_and_functions.bashrc
        rg --vimgrep "function $1 \(\) \{" $file | awk -F: '{print $1" +"$2}' | xargs nvim
    }
    if [ -z $1 ]; then
        go_to_definition_of_function_core $(list_available_functions | fzf)
    else
        go_to_definition_of_function_core $1
    fi
}
export -f go_to_definition_of_function
alias godef="go_to_definition_of_function"

function change_directory_to_previous_directory () {
	cd -
}
export -f change_directory_to_previous_directory
alias db="change_directory_to_previous_directory"

function run_custom_health_check_scripts () {
	~/dot/health/health.sh
}
export -f run_custom_health_check_scripts
alias h="run_custom_health_check_scripts"

# Parameters
# $1 is minimum
# $2 is maximum
# Will ask for parameters if not given
function random_integer_between_min_and_max () {
	if [ -z $1 ]; then
		echo "enter minimum integer of random range: "
		read min
	else
		min=$1
	fi
	if [ -z $2 ]; then
		echo "enter maximum integer of random range: "
		read max
	else
		max=$2
	fi
	echo $(($RANDOM % $max + $min))
}
export -f random_integer_between_min_and_max
alias rand="random_integer_between_min_and_max"

# trims leading and trailing whitespace
# collapses internal whitespace of more than into one space
#
# Example:
# Input (STDIN): "       foo       bar      "
# Output (STDOUT): "foo bar"
function trim_and_collapse_whitespace () {
	# https://stackoverflow.com/questions/369758/how-to-trim-whitespace-from-a-bash-variable
	# apparently, the last "echo" is not necessary as it is the default, but
	# this is obscure enough, so I will put it there!
	xargs echo
}
function display_random_custom_bash_tip () {
	count=$(list_aliases_and_functions | wc -l | trim_and_collapse_whitespace)
	index=$(random_integer_between_min_and_max 1 $count)
	chosen=$(list_aliases_and_functions | head -n $index | tail -n 1)
	echo "TIP [ $index / $count ]: $chosen"
}
export -f display_random_custom_bash_tip
alias tip="display_random_custom_bash_tip"

# Cross-Platform Notification
# Currently is known to support: MacOS
#
# Parameters:
# $* is the message text
function cs_send_notification() {
	if [[ $OSTYPE == 'darwin'* ]]; then
		X="$*" /usr/bin/osascript -e 'display notification system attribute "X"'
	else
		echo "please edit ~/dot/bash/aliases_and_functions.bashrc:cs_send_notification to include support for your current platform"
	fi
}
export -f cs_send_notification

# Removes trailing whitespace for all files in a git repository
# Skips binary files using the git "-I" flag
# Source: https://stackoverflow.com/a/10120431
function delete_trailing_space_in_git_repo() {
	git grep -I --name-only -z -e '' | xargs -0 sed -i 's/[ \t]\+\(\r\?\)$/\1/'
}
export -f delete_trailing_space_in_git_repo
