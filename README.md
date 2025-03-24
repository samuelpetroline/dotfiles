# Dotfiles

This repository contains my personal dotfiles, managed using GNU Stow. These configuration files help maintain a consistent development environment across my machines.

## Prerequisites

- GNU Stow
- macOS (tested on darwin 23.1.0)
- Zsh shell

## Tools Used

| Tool | Description | Repository |
|------|-------------|------------|
| GNU Stow | Symlink farm manager for managing dotfiles | [gnu/stow](https://github.com/aspiers/stow) |
| Zsh | Modern shell designed for interactive use | [zsh-users/zsh](https://github.com/zsh-users/zsh) |
| Oh My Zsh | Framework for managing Zsh configuration | [ohmyzsh/ohmyzsh](https://github.com/ohmyzsh/ohmyzsh) |
| Neovim | Hyperextensible Vim-based text editor | [neovim/neovim](https://github.com/neovim/neovim) |
| Yabai | Tiling window manager for macOS | [koekeishiya/yabai](https://github.com/koekeishiya/yabai) |
| SKHD | Simple hotkey daemon for macOS | [koekeishiya/skhd](https://github.com/koekeishiya/skhd) |
| SketchyBar | Highly customizable macOS status bar replacement | [FelixKratz/SketchyBar](https://github.com/FelixKratz/SketchyBar) |
| Atuin | Magical shell history | [atuinsh/atuin](https://github.com/atuinsh/atuin) |

### Basic Stow Commands

- `stow .` - Create symlinks for all configurations
- `stow -D .` - Remove all symlinks
- `stow -R .` - Restow (remove and then recreate) all symlinks 