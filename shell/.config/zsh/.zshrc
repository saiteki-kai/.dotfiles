# Uncomment to profile
# zmodload zsh/zprof

# More detailed profiling:
# zmodload zsh/datetime
# setopt promptsubst
# PS4='+$EPOCHREALTIME %N:%i> '
# exec 3>&2 2> startlog.$$
# setopt xtrace prompt_subst

# History setup ---------------------------------------------------------------

HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
HISTSIZE=10000
SAVEHIST=10000
HISTDUP=erase

setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt SHARE_HISTORY

source <(fzf --zsh)  # history fuzzy search

# Vi settings -----------------------------------------------------------------

bindkey -v
export KEYTIMEOUT=1

# Sources ---------------------------------------------------------------------

source "$ZDOTDIR/aliases"
source "$ZDOTDIR/keybindings"

# Plugins ---------------------------------------------------------------------

autoload -Uz $ZDOTDIR/plugins/zsh-defer/zsh-defer
# zsh-defer source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh # Disabled for now, causes issues with vim mode
zsh-defer source $ZDOTDIR/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
fpath=($ZDOTDIR/plugins/zsh-completions/src $fpath)

# Completions -----------------------------------------------------------------

autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
zsh-defer compinit
_comp_options+=(globdots)               # Include hidden files.

# Prompt ----------------------------------------------------------------------

eval "$(starship init zsh)"

# FZF -------------------------------------------------------------------------
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git "
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --hidden --type=d --strip-cwd-prefix --exclude .git "
export FZF_DEFAULT_OPTS="--height 50% --layout=default --border"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"

# Command completions and configs ---------------------------------------------

eval "$(zoxide init zsh --cmd cd)"
