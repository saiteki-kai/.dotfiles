# This file is sourced by all invocations of the shell.
# It's the right place to define environment variables and the PATH.
# It should contain minimal configuration needed for both interactive and non-interactive shells.
# Heavy configuration or configuration only needed for interactive shells should not be here.

typeset -U PATH path

export LANG=en_US.UTF-8
export EDITOR='nvim'
export VISUAL=$EDITOR
export TERMINAL="kitty"
export COLORTERM="truecolor"

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

export ZSH="$HOME/.oh-my-zsh"

export PATH=/usr/local/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/scripts:$PATH

. "$HOME/.cargo/env"
