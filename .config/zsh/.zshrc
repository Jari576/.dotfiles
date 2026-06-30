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
source "$ZDOTDIR/nvm_init"

[ -x "$(command -v starship)" ] && eval "$(starship init zsh)"
[ -x "$(command -v zoxide)" ] && eval "$(zoxide init zsh)"
[ -x "$(command -v keychain)" ] && eval "$(keychain --eval --quiet --confhost --inherit any)"
[ -x "$(command -v thefuck)" ] && eval "$(thefuck --alias)"

# The next line updates PATH for the Google Cloud SDK.
[ -f '$HOME/.local/share/google-cloud-sdk/path.zsh.inc' ] && . '$HOME/.local/share/google-cloud-sdk/path.zsh.inc'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
