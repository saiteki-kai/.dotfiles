# This file is sourced by all invocations of the shell.
# It's the right place to define environment variables and the PATH.
# It should contain minimal configuration needed for both interactive and non-interactive shells.
# Heavy configuration or configuration only needed for interactive shells should not be here.

# Settings
export LANG=en_US.UTF-8
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="ghostty"
export COLORTERM="truecolor"

# XDG base directories
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

# Oh My Zsh installation path
export ZSH="$HOME/.oh-my-zsh"

# Paths
path=(
    $path # Prepend existing PATH
    /usr/local/bin 
    $HOME/bin
    $HOME/.local/bin
    $HOME/.local/scripts
    $HOME/Applications/Android/flutter/bin
    $HOME/.nvm/versions/node/v22.12.0/bin/
)

# Remove duplicate entries
typeset -U path
path=($^path(N-/))

# Export the updated PATH
export PATH

# Source cargo environment
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
