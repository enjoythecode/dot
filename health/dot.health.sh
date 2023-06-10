#!/bin/bash

# Parameters
# $1 is the name of the command that should exist
function check_command_exists() {
	if command -v $1 &> /dev/null
	then
		echo "[OK] $1 exists in your system"
	else
		echo "[!!] $1 was not found as an executable. Suggestion: Visit $S_PATH_DOT/README.md; install $1"
	fi
}

check_command_exists grep
check_command_exists fzf
check_command_exists nvim
check_command_exists git
check_command_exists python3
# I'm not sure why I might actually need this -- sinan, 2023-06-09
# check_command_exists dot  # graphviz: https://graphviz.org/download/
check_command_exists pre-commit
