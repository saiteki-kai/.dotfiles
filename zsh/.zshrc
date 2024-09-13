# This file is sourced by interactive shells only.
# It's the right place for aliases, functions, shell options, prompt settings, and other interactive shell configuration.
# Environment variables that are only needed for interactive shells can also be defined here.

# Theme
ZSH_THEME="simple"

# Options
HYPHEN_INSENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Plugins
plugins=(git zsh-syntax-highlighting zsh-autosuggestions nvm)

zstyle ':omz:plugins:nvm' lazy yes

# Sources
source $ZSH/oh-my-zsh.sh
source ~/.zsh/.zsh_aliases
source ~/.zsh/.zsh_keybindings

# Environment Variables
export PROJECTS_DIR=${HOME}/Documents/03_Projects
export DOT_DIR=${PROJECTS_DIR}/01_Active/.dotfiles
export BAT_THEME="Catppuccin-frappe"
