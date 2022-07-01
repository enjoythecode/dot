# Common 1-ers
alias t="ls -la" # left index finger on Colemak
alias l="ls -la"
alias d="cd"
alias s="git status" # left middle finger on Colemak
alias p="cp"
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
function gac () {
    git status
    git add .
    git commit
}

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
alias ev="$EDITOR ~/.vimrc"

# Misc.
alias dog="git log --all --decorate --oneline --graph" # https://stackoverflow.com/a/35075021

alias dimp='java -jar ~/import/tool/target/datacommons-import-tool-0.1-alpha.1-jar-with-dependencies.jar'
