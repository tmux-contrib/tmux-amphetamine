# tmux-amphetamine

A tmux plugin that displays the [Amphetamine](https://apps.apple.com/app/amphetamine/id937984704) session status in the status bar.

## Installation

```tmux
# configure the tmux plugins manager
set -g @plugin "tmux-plugins/tpm"

# official plugins
set -g @plugin 'tmux-contrib/tmux-amphetamine'
```

## Usage

Add the `#{amphetamine_status}` format string to your status bar:

```tmux
set -g status-right "#{amphetamine_status} | %H:%M"
```

### Options

| Option                         | Default | Description                      |
|--------------------------------|---------|----------------------------------|
| `@amphetamine_session_on_icon` | "󰻂"    | Icon when a session is active    |
| `@amphetamine_session_off_icon`| "󰻃"    | Icon when no session is active   |

### Format Strings

| Format String           | Description                          |
|-------------------------|--------------------------------------|
| `#{amphetamine_status}` | Current Amphetamine session status   |
