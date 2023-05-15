#!/bin/bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck disable=1090
source "${CURRENT_DIR}/scripts/helpers.sh"

amphetamine_status="#(${CURRENT_DIR}/scripts/amphetamine.sh)"
amphetamine_status_pattern="\#{amphetamine_status}"

tmux_update_option() {
	local option="$1"
	local option_value
	local new_option_value

	option_value="$(tmux_get_option "$option")"
	new_option_value="$(tmux_interpolate "$option_value" "$amphetamine_status_pattern" "$amphetamine_status")"

	tmux_set_option "$option" "$new_option_value"
}

main() {
	tmux_update_option "status-right"
	tmux_update_option "status-left"
}

main
