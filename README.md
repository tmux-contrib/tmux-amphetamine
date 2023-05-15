# tmux-amphetamine

This plugin displays the [Amphetamine
Application](https://apps.apple.com/us/app/amphetamine/id937984704?mt=12)
status.

## Installation

This is a plugin for [tmux plugin
manager](https://github.com/tmux-plugins/tpm). You can install it by adding the
following line in your tmux config.

```shell
set -g @plugin 'tmux-contrib/tmux-amphetamine'
```

## Getting Started

You can use the `#{amphetamine_status}` variable in your existing status line.

```shell
set-option -g status-right '#{amphetamine_status}'
```
