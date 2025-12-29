# Enable prompt substitution
setopt PROMPT_SUBST

# Colors
autoload -U colors && colors

# vcs_info (git + hg)
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:git:*' formats "%F{78}%b%f%F{214}%c%u%f"
zstyle ':vcs_info:hg:*' formats "%F{78}%b%f%F{214}%c%u%f"

git_prompt_info() {
    [[ -n "$vcs_info_msg_0_" ]] && echo " $vcs_info_msg_0_"
}

hg_prompt_info() {
    [[ -n "$vcs_info_msg_0_" && "$vcs_info_backend_" == "hg" ]] && echo "$vcs_info_msg_0_"
}

# virtualenv helper
virtualenv_prompt_info() {
    [[ -n "$VIRTUAL_ENV" ]] && echo " ${ZSH_THEME_VIRTUALENV_PREFIX}${VIRTUAL_ENV:t}${ZSH_THEME_VIRTUALENV_SUFFIX}"
}

PROMPT='%(!.%{$fg[red]%}.%{$fg[green]%})%~$(git_prompt_info)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[blue]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[blue]%})"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔"
