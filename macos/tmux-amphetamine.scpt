#!/usr/bin/env osascript

-- Check if an Amphetamine session is active.
--
-- Queries the Amphetamine app (macOS keep-awake utility) to determine
-- if a session is currently active (preventing the system from sleeping).
--
-- Returns:
--   "true" if a session is active
--   "false" if no session is active
--
-- Usage:
--   ./tmux-amphetamine.scpt
--   # Output: "true" or "false"
--
-- Dependencies:
--   - Amphetamine app must be installed (https://apps.apple.com/app/amphetamine/id937984704)

tell application "Amphetamine"
	session is active
end tell
