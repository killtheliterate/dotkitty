# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a kitty terminal emulator configuration repository. It manages fonts, themes, and keybindings for kitty on Fedora Linux.

## Configuration Structure

- `kitty.conf` — main config; sets font, keybindings, clipboard control, and includes `current-theme.conf`
- `current-theme.conf` — active theme (symlink-style: copy of whichever theme is active)
- `frappe.conf` — Catppuccin Frappe (dark) theme
- `latte.conf` — Catppuccin Latte (light) theme
- `font-fixes.conf` — `symbol_map` entries mapping Nerd Font unicode ranges to "Symbols Nerd Font" (not currently included in `kitty.conf` — must be added manually if needed)

## Applying Changes

Kitty reloads config on `ctrl+shift+f5` (or `kill -SIGUSR1 $(pgrep kitty)`). No build step needed.

## Switching Themes

To switch themes, copy the desired theme file over `current-theme.conf`:
```
cp frappe.conf current-theme.conf   # dark
cp latte.conf current-theme.conf    # light
```

Or use kitty's built-in theme switcher: `kitty +kitten themes`

## Font Setup

- Primary font: JetBrains Mono (or MonoLisa, commented out as alternative)
- Nerd Font symbols: requires "Symbols Nerd Font" installed separately
- `font-fixes.conf` contains `symbol_map` entries for all Nerd Font unicode ranges — include it in `kitty.conf` if icons are missing
- Debug font fallback: `kitty --debug-font-fallback`
- Test Nerd Font rendering: `bash font-test.sh`

## Key Mapping

- `cmd+shift+t` — opens an overlay running `tab-name.sh` then tmux (sets kitty tab title to tmux session name)

## Remote Control

`allow_remote_control yes` is set to support `kitty @ set-colors` for live color changes.
