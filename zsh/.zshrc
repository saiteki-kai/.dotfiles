# This file is sourced by interactive shells only.
# It's the right place for aliases, functions, shell options, prompt settings, and other interactive shell configuration.
# Environment variables that are only needed for interactive shells can also be defined here.

# Theme
ZSH_THEME="simple"

# Options
HYPHEN_INSENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Plugins
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

# Performance optimizations
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_COMPFIX="true"

# Cache completions
autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi

# Sources
source $ZSH/oh-my-zsh.sh
source ~/.zsh/.zsh_aliases
source ~/.zsh/.zsh_keybindings

# Environment Variables
export PROJECTS_DIR=${HOME}/Documents/03_Projects
export DOT_DIR=${PROJECTS_DIR}/01_Active/dotfiles
