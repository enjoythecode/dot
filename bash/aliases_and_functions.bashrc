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
alias gs="git status"
alias ga="git add "
alias gb="git branch "
alias all="gall"
alias gall="git add ."
alias gp="git push"
alias g2="git push" # git "to"
alias g4="git pull" # git "from"
alias gcm="git commit -m "
alias gca="git commit --amend"
alias gd="git diff "
alias gds="git diff --staged "
alias gc="git checkout "
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
alias sb=". ~/.bashrc"

# "E"dit
alias e="$EDITOR"
alias eb="$EDITOR ~/.bashrc"
alias eba="$EDITOR ~/dot/bash/aliases_and_functions.bashrc"
alias ebe="$EDITOR ~/dot/bash/exports.bashrc"
alias ebcfg="$EDITOR ~/dot/bash/configuration.bashrc"
alias ebc="$EDITOR ~/dot/bash/components.bashrc"
alias ev="$EDITOR ~/.config/nvim/init.vim"
alias r="$EDITOR ./README.md"
alias t="$EDITOR ./TODO.md"
alias th="$EDITOR ~/TODO.md"

# "L"ist
alias lh="ls -la ~"

# Misc.
alias dog="git log --all --decorate --oneline --graph" # https://stackoverflow.com/a/35075021
alias golden="mvn -DgoldenFilesPrefix=$PWD/tool/src/test/resources/org/datacommons/tool package"

alias dimp='java -jar ~/import/tool/target/datacommons-import-tool-0.1-alpha.1-jar-with-dependencies.jar'

# Functions
function list_aliases_and_function_names_in_dot_bashrc () {
    grep -e alias -e function ~/dot/bash/aliases_and_functions.bashrc
    # alias + declare -F does the same but for everything that bash knows about!
}
export -f list_aliases_and_function_names_in_dot_bashrc

function list_available_functions () {
    declare -F | awk 'sub("declare -fx ", "")'
}
export -f list_available_functions

function list_available_aliases () {
    alias | awk 'sub("alias ", "")'
}
export -f list_available_aliases

function fzf_available_functions_and_execute_it () {
    list_available_functions | fzf --preview="explain_how_function_works {}" | xargs -I {} bash -c -i '{}'
}
export -f fzf_available_functions_and_execute_it
alias p="fzf_available_functions_and_execute_it"

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
        how_core $1
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
	~/dot/sh/health/health.sh
}
export -f run_custom_health_check_scripts
alias h="run_custom_health_check_scripts"
