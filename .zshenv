#!/bin/sh

typeset -U PATH path
path=("$HOME/.local/bin" "$(ruby -e 'puts Gem.user_dir')/bin" "$HOME/.cargo/bin" "$HOME/go/bin" "$HOME/.deno/bin" "$path[@]")
export PATH

export ZDOTDIR="$HOME/.config/zsh"
export TERMINAL=kitty

# fix for no cursor on Wayland
# export WLR_NO_HARDWARE_CURSORS=1
