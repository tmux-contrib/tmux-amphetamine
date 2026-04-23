# tmux-amphetamine

> Show [Amphetamine](https://apps.apple.com/app/amphetamine/id937984704) keep-awake session status in your tmux status bar.

[![CI](https://github.com/tmux-contrib/tmux-amphetamine/actions/workflows/ci.yml/badge.svg)](https://github.com/tmux-contrib/tmux-amphetamine/actions/workflows/ci.yml) [![Release](https://img.shields.io/github/v/release/tmux-contrib/tmux-amphetamine)](https://github.com/tmux-contrib/tmux-amphetamine/releases) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## Dependencies

- macOS with [Amphetamine](https://apps.apple.com/app/amphetamine/id937984704) installed

## Installation

Add this plugin to your `~/.tmux.conf`:

```tmux
set -g @plugin 'tmux-contrib/tmux-amphetamine'
```

And install it by running `<prefix> + I`.

## Usage

Add the `#{amphetamine}` format string to your status bar:

```tmux
set -g status-right "#{amphetamine} | %H:%M"
```

## Configuration

| Option                        | Default | Description                      |
|-------------------------------|---------|----------------------------------|
| `@amphetamine-active-icon`    | "󰻂"    | Icon when a session is active    |
| `@amphetamine-inactive-icon`  | "󰻃"    | Icon when no session is active   |

### Format Strings

| Format String    | Description                          |
|------------------|--------------------------------------|
| `#{amphetamine}` | Current Amphetamine session status   |

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
