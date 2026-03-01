# tmux-amphetamine

A tmux plugin that displays the [Amphetamine](https://apps.apple.com/app/amphetamine/id937984704) session status in the status bar.

## Dependencies

- macOS with [Amphetamine](https://apps.apple.com/app/amphetamine/id937984704) installed

## Installation

Add this plugin to your `~/.tmux.conf`:

```tmux
set -g @plugin 'tmux-contrib/tmux-amphetamine'
```

And install it by running `<prefix> + I`.

## Usage

Add the `#{amphetamine_status}` format string to your status bar:

```tmux
set -g status-right "#{amphetamine_status} | %H:%M"
```

## Configuration

| Option                         | Default | Description                      |
|--------------------------------|---------|----------------------------------|
| `@amphetamine_session_on_icon` | "󰻂"    | Icon when a session is active    |
| `@amphetamine_session_off_icon`| "󰻃"    | Icon when no session is active   |

### Format Strings

| Format String           | Description                          |
|-------------------------|--------------------------------------|
| `#{amphetamine_status}` | Current Amphetamine session status   |

## Development

### Prerequisites

Install dependencies using [Nix](https://nixos.org/):

```sh
nix develop
```

Or install manually: `bash`, `tmux`, `bats`

### Running Tests

```sh
bats tests/
```

### Debugging

Enable trace output with the `DEBUG` environment variable:

```sh
DEBUG=1 /path/to/tmux-amphetamine/scripts/tmux_amphetamine.sh
```

## License

MIT
