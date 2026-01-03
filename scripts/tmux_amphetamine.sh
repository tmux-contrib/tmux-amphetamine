#!/usr/bin/env bash

# Get the Amphetamine session status with customizable icons.
#
# Retrieves the current session status from the Amphetamine app (macOS keep-awake
# utility) and displays an appropriate icon based on whether a session is active.
#
# Configuration Options:
#   @amphetamine_session_on_icon  - Icon when session is active (default: "󰻂")
#   @amphetamine_session_off_icon - Icon when session is inactive (default: "󰻃")
#
# Globals:
#   None
# Arguments:
#   None
# Outputs:
#   The session status icon to stdout
# Returns:
#   0 on success
# Dependencies:
#   - macos/tmux-amphetamine.scpt: AppleScript to query Amphetamine app

_tmux_amphetamine_source_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
_tmux_amphetamine_plugin_dir="$(dirname "$_tmux_amphetamine_source_dir")"

# shellcheck source=tmux_amphetamine_core.sh
source "$_tmux_amphetamine_source_dir/tmux_amphetamine_core.sh"

# Main entry point for the Amphetamine status script.
#
# Queries Amphetamine session status via AppleScript and displays the
# appropriate icon based on whether a session is active.
#
# Globals:
#   None
# Arguments:
#   None
# Outputs:
#   Session status icon (on or off icon)
# Returns:
#   0 on success
main() {
	local opt_session_active
	local opt_session_on_icon
	local opt_session_off_icon

	opt_session_on_icon="$(_tmux_get_option "@amphetamine_session_on_icon" "󰻂")"
	opt_session_off_icon="$(_tmux_get_option "@amphetamine_session_off_icon" "󰻃")"
	opt_session_active="$("$_tmux_amphetamine_plugin_dir/macos/tmux-amphetamine.scpt")"

	if [[ "$opt_session_active" == "true" ]]; then
		echo "$opt_session_on_icon"
	else
		echo "$opt_session_off_icon"
	fi
}

main
