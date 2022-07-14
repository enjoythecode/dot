#!/bin/bash

# Parameters
# $1 is the name of the command that should exist
function check_command_exists() {
	if command -v $1 &> /dev/null
	then
		echo "[OK] $1 exists in your system"
	else
		echo "[!!] $1 was not found as an executable"
		echo "[AC] Visit ~/dot/README.md; install $1"
	fi
}

check_command_exists grep