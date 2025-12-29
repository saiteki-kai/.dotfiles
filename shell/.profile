# commands and variables which should be set once 
# or which don't need to be updated frequently

# Environment variables --------------------------------------------------------

export LANG=en_US.UTF-8
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="foot"
export COLORTERM="truecolor"
export TERM="tmux-256color"

# xdg 
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

# home cleanup 
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# directories
export PROJECTS_DIR=${HOME}/Documents/03_Projects
export DOT_DIR=${PROJECTS_DIR}/01_Active/dotfiles

# GPG/SSH ----------------------------------------------------------------------

export GPG_TTY="$(tty)" 
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

gpgconf --launch gpg-agent

# Path configuration -----------------------------------------------------------

path_add() {
  [ -d "$1" ] || return

  case ":$PATH:" in
    *":$1:"*) :;;
    *) PATH="$1:$PATH" ;;
  esac
}

path_add "/usr/local/bin"
path_add "$HOME/bin"
path_add "$HOME/.local/bin"
path_add "$HOME/.local/scripts"
path_add "$HOME/Applications/flutter/bin"

# Export the updated PATH
export PATH
