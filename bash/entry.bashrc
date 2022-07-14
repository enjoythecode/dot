# only source components.bashrc (loads all of my bashrc components)
# if not sourced before
if [[ -z "${CUSTOM_BASHRC_SOURCED}" ]]; then
	source $HOME/dot/bash/components.bashrc
	display_random_custom_bash_tip
fi
