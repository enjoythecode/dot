# Common 1-ers
alias l="ls -la"
alias d="cd"
alias s="git status" # left middle finger on Colemak
alias c="clear"
alias v="mv"
alias o="open"

# "G"it
alias gs="git status"
alias ga="git add "
alias gb="git branch "
alias all="gall"
alias gall="git add ."
alias gp="git push"
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
alias ebc="$EDITOR ~/dot/bash/configuration.bashrc"
alias ev="$EDITOR ~/.config/nvim/init.vim"

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
    list_available_functions | fzf | xargs -I {} bash -c -i '{}'
}
export -f fzf_available_functions_and_execute_it
alias p="fzf_available_functions_and_execute_it"
