# dotfiles

dotfiles I use

## Purpose

Minimal config for a decent dev setup. You won't find here anything too fancy or a ton of files/folders.

This setup is meant to be portable. Other than the nord colorscheme, that affects a few files, every dotfile can be setup independently.

## Install

There is no install script. Depending on the environment I'm using I set up all the tools or a subset of them.

### Neovim to load .vimrc

Edit the `~/.config/nvim/init.vim` file to contain:

```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
```

## Private config

To avoid leaking personal/work related config, a `~/.zshrc_private` file is sourced from `~/.zshrc`. 

## Env Setup

Tools (in no particular order):
 - alacritty: GPU accelerated terminal
 - ripgrep: fast `grep` and `awk` replacement
 - fzf: fuzzy finder
 - zsh: posix compliant shell with bells
   - oh-my-zsh: bells for zsh
   - zsh autosuggestions: completion for zsh
   - zsh fzf plugin: handy fzf aliasses
 - tmux: terminal multiplexer
 - vim: editor of choice
 - ranger: file manager
 - tig: git curses client
 - lua: scripting language for automation
 - tldr: short man pages
 - exa: replacement for ls
 - bat: replacement for cat
 - coreutils: GNU bins

Theme:
 - nord 

### Coreutils

By default GNU coreutils are not included in `PATH` by default.

```shell
PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
```

### Move windows on Mac

To move windows on Mac with `Ctrl` + `Cmd` + `Drag`: 

```shell
defaults write -g NSWindowShouldDragOnGesture -bool true   
sudo reboot
```

To disable this, run 
```defaults delete -g NSWindowShouldDragOnGesture```

