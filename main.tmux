#!/usr/bin/env bash

# tmux-amphetamine plugin entry point.
#
# This plugin provides a #{amphetamine_status} format string that displays
# the current status of the Amphetamine app (macOS keep-awake utility) in
# the tmux status bar.
#
# Usage:
#   Add #{amphetamine_status} to your status-left or status-right option.
#
# Example:
#   set -g status-right "#{amphetamine_status} | %H:%M"
#
# Configuration:
#   @amphetamine_session_on_icon  - Icon when active (default: "󰻂")
#   @amphetamine_session_off_icon - Icon when inactive (default: "󰻃")

_tmux_root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck source=scripts/tmux_core.sh
source "$_tmux_root_dir/scripts/tmux_core.sh"

amphetamine_status="#($_tmux_root_dir/scripts/tmux_amphetamine.sh)"
amphetamine_status_pattern="\#{amphetamine_status}"

# Update a tmux option by interpolating the amphetamine status pattern.
#
# Retrieves the current value of the specified tmux option, replaces any
# occurrences of #{amphetamine_status} with the actual command string, and
# sets the option to the new value.
#
# Globals:
#   amphetamine_status - The tmux command string to get Amphetamine status
#   amphetamine_status_pattern - The pattern to replace (#{amphetamine_status})
# Arguments:
#   $1 - The name of the tmux option to update (e.g., "status-right")
# Returns:
#   0 on success
_tmux_update_option() {
	local option="$1"
	local option_value
	local new_option_value

	option_value="$(_tmux_get_option "$option")"
	new_option_value="$(_tmux_interpolate "$option_value" "$amphetamine_status_pattern" "$amphetamine_status")"

	_tmux_set_option "$option" "$new_option_value"
}

# Main entry point for the plugin.
#
# Initializes the Amphetamine plugin by updating the status-right and
# status-left options to interpolate the amphetamine_status pattern.
#
# Globals:
#   None
# Arguments:
#   None
# Returns:
#   0 on success
main() {
	_tmux_update_option "status-right"
	_tmux_update_option "status-left"
}

main
