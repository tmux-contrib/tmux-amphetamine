# tmux-amphetamine API Documentation

This document describes the public API for the tmux-amphetamine plugin.

## Table of Contents

- [Overview](#overview)
- [Format Strings](#format-strings)
- [Configuration](#configuration)
- [Core Functions](#core-functions)
  - [tmux_get_option](#tmux_get_option)
  - [tmux_set_option](#tmux_set_option)
  - [tmux_interpolate](#tmux_interpolate)
- [Plugin Functions](#plugin-functions)
  - [main (tmux-amphetamine.sh)](#main-tmux-amphetaminesh)
  - [tmux_update_option](#tmux_update_option)
- [macOS Integration](#macos-integration)
  - [tmux-amphetamine.scpt](#tmux-amphetaminescpt)

---

## Overview

The tmux-amphetamine plugin displays the current status of the Amphetamine app
(a macOS keep-awake utility) in the tmux status bar. It shows an icon indicating
whether the system is being kept awake.

## Format Strings

| Format String           | Description                              |
|-------------------------|------------------------------------------|
| `#{amphetamine_status}` | Current Amphetamine session status icon  |

**Usage Example:**
```tmux
set -g status-right "#{amphetamine_status} | %H:%M"
```

## Configuration

| Option                          | Description                    | Default |
|---------------------------------|--------------------------------|---------|
| `@amphetamine_session_on_icon`  | Icon when session is active    | `"󰻂"`   |
| `@amphetamine_session_off_icon` | Icon when session is inactive  | `"󰻃"`   |

**Example:**
```tmux
set -g @amphetamine_session_on_icon ""
set -g @amphetamine_session_off_icon ""
```

---

## Core Functions

Located in `scripts/core.sh`.

### tmux_get_option

Get a tmux option value.

Retrieves the value of a global tmux option. If the option is not set,
returns the provided default value.

```bash
tmux_get_option "option_name" "default_value"
```

**Arguments:**
- `$1` - The name of the tmux option to retrieve
- `$2` - The default value to return if the option is not set

**Outputs:**
- The option value or default value to stdout

**Returns:**
- `0` on success

---

### tmux_set_option

Set a tmux option value.

Sets a global tmux option to the specified value.

```bash
tmux_set_option "option_name" "value"
```

**Arguments:**
- `$1` - The name of the tmux option to set
- `$2` - The value to set the option to

**Returns:**
- `0` on success, non-zero on failure

---

### tmux_interpolate

Interpolate a pattern in content with a value.

Replaces a pattern in the given content string with the specified value.
This is useful for substituting tmux format strings with actual values.

```bash
tmux_interpolate "content with #{pattern}" "#{pattern}" "replacement"
# Output: "content with replacement"
```

**Arguments:**
- `$1` - The content string containing the pattern
- `$2` - The pattern to replace
- `$3` - The value to substitute for the pattern

**Outputs:**
- The content with the pattern replaced by the value

**Returns:**
- `0` on success

---

## Plugin Functions

### main (tmux-amphetamine.sh)

Located in `scripts/tmux-amphetamine.sh`.

Get the Amphetamine session status with customizable icons.

Retrieves the current session status from the Amphetamine app and displays
an appropriate icon based on whether a session is active.

```bash
./scripts/tmux-amphetamine.sh
# Output: "󰻂" (active) or "󰻃" (inactive)
```

**Arguments:**
- None

**Outputs:**
- The session status icon to stdout

**Returns:**
- `0` on success

**Dependencies:**
- `macos/tmux-amphetamine.scpt`: AppleScript to query Amphetamine app

---

### tmux_update_option

Located in `main.tmux`.

Update a tmux option by interpolating the amphetamine status pattern.

Retrieves the current value of the specified tmux option, replaces any
occurrences of `#{amphetamine_status}` with the actual command string, and
sets the option to the new value.

```bash
tmux_update_option "status-right"
```

**Arguments:**
- `$1` - The name of the tmux option to update (e.g., "status-right")

**Returns:**
- `0` on success

---

## macOS Integration

Located in `macos/` directory.

### tmux-amphetamine.scpt

AppleScript to check Amphetamine session status.

Queries the Amphetamine app to determine if a session is currently active
(preventing the system from sleeping).

```bash
./macos/tmux-amphetamine.scpt
# Output: "true" or "false"
```

**Returns:**
- `"true"` if a session is active
- `"false"` if no session is active

**Dependencies:**
- [Amphetamine app](https://apps.apple.com/app/amphetamine/id937984704) must be installed
