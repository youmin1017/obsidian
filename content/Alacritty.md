---
tags:
  - TerminalEmulator
---

```ad-info
Alacritty - A fast, cross-platform, OpenGL terminal emulator
```

[Alacritty](https://github.com/alacritty/alacritty)

## Installation

```bash
brew install alacritty
```

## Configuration

You can find the default configuration file with documentation for all available fields on the [GitHub releases page](https://github.com/alacritty/alacritty/releases) for each release.

Alacritty doesn't create the config file for you, but it looks for one in the following locations:

1.  `$XDG_CONFIG_HOME/alacritty/alacritty.yml`
2.  `$XDG_CONFIG_HOME/alacritty.yml`
3.  `$HOME/.config/alacritty/alacritty.yml`
4.  `$HOME/.alacritty.yml`

### [](https://github.com/alacritty/alacritty#windows)Windows

On Windows, the config file should be located at:

`%APPDATA%\alacritty\alacritty.yml`

### Personal Config
```yaml
# ~/.config/alacritty/alacritty.yml
window:
  opacity: 0.85
  dimensions:
    columns: 125
    lines: 40
  padding:
    x: 16
    y: 16
  dynamic_padding: false
  # decorations: buttonless

font:
  normal:
    family: "Hack Nerd Font Mono"
    style: Regular
  size: 16.0
```