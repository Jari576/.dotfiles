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
if [ -f '/home/TriOpSys.net/jbervoets/.local/share/google-cloud-sdk/path.zsh.inc' ]; then . '/home/TriOpSys.net/jbervoets/.local/share/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/TriOpSys.net/jbervoets/.local/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/TriOpSys.net/jbervoets/.local/share/google-cloud-sdk/completion.zsh.inc'; fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
