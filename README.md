# tmux-amphetamine

A tmux plugin that displays the [Amphetamine](https://apps.apple.com/app/amphetamine/id937984704) session status in the status bar.

## Features

- Display whether Amphetamine is keeping your Mac awake
- Customizable icons for active/inactive states
- Lightweight AppleScript integration

## Requirements

- macOS
- [Amphetamine](https://apps.apple.com/app/amphetamine/id937984704) app installed

## Installation

### Using TPM

Add the following line to your `~/.tmux.conf`:

```tmux
set -g @plugin 'tmux-contrib/tmux-amphetamine'
```

Then press `prefix` + <kbd>I</kbd> to install.

### Manual

Clone the repository:

```bash
git clone https://github.com/tmux-contrib/tmux-amphetamine ~/.tmux/plugins/tmux-amphetamine
```

Add to your `~/.tmux.conf`:

```tmux
run-shell ~/.tmux/plugins/tmux-amphetamine/main.tmux
```

## Usage

Add the `#{amphetamine_status}` format string to your status bar:

```tmux
set -g status-right "#{amphetamine_status} | %H:%M"
```

### Format Strings

| Format String           | Description                          |
|-------------------------|--------------------------------------|
| `#{amphetamine_status}` | Current Amphetamine session status   |

### Configuration

Customize the icons for each state:

```tmux
# Icon when a session is active (default: "󰻂")
set -g @amphetamine_session_on_icon "󰻂"

# Icon when no session is active (default: "󰻃")
set -g @amphetamine_session_off_icon "󰻃"
```

### Example Output

- `󰻂` - Session active (Mac is being kept awake)
- `󰻃` - No active session

## Documentation

See [docs/API.md](docs/API.md) for the full API documentation.

## License

[MIT](LICENSE)
