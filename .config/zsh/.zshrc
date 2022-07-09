#!/bin/sh

source "$ZDOTDIR/env"

source "$ZDOTDIR/plugin_functions"
mkdir -p $PLUGINS_DIRECTORY
zsh_sync_plugins_with_file $ZDOTDIR/plugins

source "$ZDOTDIR/functions"
source "$ZDOTDIR/aliases"
source "$ZDOTDIR/options"
source "$ZDOTDIR/completion"
source "$ZDOTDIR/keybinds"

# source "$ZDOTDIR/conda_initialize"

eval "$(starship init zsh)"
eval $(keychain --eval --quiet --confhost)
eval "$(zoxide init zsh)"
