#!/bin/bash

tmux_get_option() {
	local option="$1"
	local default_value="$2"
	local option_value

	option_value="$(tmux show-option -gqv "$option")"
	# return the option value
	[[ -n "$option_value" ]] && echo "$option_value" || echo "$default_value"
}

tmux_set_option() {
	local option="$1"
	local value="$2"
	# set the option value
	tmux set-option -gq "$option" "$value"
}

tmux_interpolate() {
	local content=$1
	local pattern=$2
	local value=$3

	content=${content/$pattern/$value}

	echo "$content"
}
