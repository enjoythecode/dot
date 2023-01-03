# only source components.bashrc (loads all of my bashrc components)
# if not sourced before
if [[ -z "${CUSTOM_BASHRC_SOURCED}" ]]; then
	# https://codefather.tech/blog/bash-get-script-directory/
	SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
	source $SCRIPT_DIR/components.sh
	display_random_custom_bash_tip
fi
