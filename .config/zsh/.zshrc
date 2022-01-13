#!/bin/sh

source "$ZDOTDIR/envvars"

source "$ZDOTDIR/plugin_functions"
mkdir -p $PLUGINS_DIRECTORY
zsh_sync_plugins_with_file $ZDOTDIR/plugins

source "$ZDOTDIR/functions"
source "$ZDOTDIR/aliases"
source "$ZDOTDIR/options"
source "$ZDOTDIR/completion"
source "$ZDOTDIR/keybinds"

eval "$(starship init zsh)"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

