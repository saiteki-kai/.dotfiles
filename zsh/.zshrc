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

# Sources
source $ZSH/oh-my-zsh.sh
source ~/.zsh/.zsh_aliases
source ~/.zsh/.zsh_keybindings

# Environment Variables
export PROJECTS_DIR=${HOME}/MEGA/プロジェクト/進行中
export GIT_PROJECT_DIR=${HOME}/MEGA/プロジェクト/github
export BAT_THEME="Catppuccin-frappe"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
