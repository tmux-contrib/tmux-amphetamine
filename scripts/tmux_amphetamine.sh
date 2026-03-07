#!/usr/bin/env bash
set -euo pipefail
[[ -z "${DEBUG:-}" ]] || set -x

_tmux_amphetamine_source_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

[[ -f "$_tmux_amphetamine_source_dir/tmux_core.sh" ]] || {
	echo "tmux-amphetamine: missing tmux_core.sh" >&2
	exit 1
}

# shellcheck source=tmux_core.sh
source "$_tmux_amphetamine_source_dir/tmux_core.sh"

main() {
	local opt_session_active
	local opt_session_on_icon
	local opt_session_off_icon

	opt_session_on_icon="$(_tmux_get_option "@amphetamine-active-icon" "󰻂")"
	opt_session_off_icon="$(_tmux_get_option "@amphetamine-inactive-icon" "󰻃")"
	opt_session_active="$("$(dirname "$_tmux_amphetamine_source_dir")/macos/tmux-amphetamine.scpt")"

	if [[ "$opt_session_active" == "true" ]]; then
		echo "$opt_session_on_icon"
	else
		echo "$opt_session_off_icon"
	fi
}

main
