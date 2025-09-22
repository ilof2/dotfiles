# FZF
eval "$(fzf --zsh)"
export FZF_DEFAULT_OPTS=" \
--color=fg:#C6C0B9,header:#A97070,info:#778C73,pointer:#A97070 \
--color=marker:#6C7F93,prompt:#778C73,hl+:#CC9166 \
--color=selected-bg:#4D4D4D \
--color=border:#4D4D4D,label:#6C7F93"

# Direnv
eval "$(direnv hook zsh)"
# Zoxide
eval "$(zoxide init zsh)"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Spicetify
export PATH=$PATH:/home/ilof/.spicetify

# CTRL-Z in both way
function ctrlz() {
if [[ $#BUFFER == 0 ]]; then
    fg >/dev/null 2>&1 && zle redisplay
else
    zle push-input
fi
}

zle -N ctrlz
bindkey '^Z' ctrlz

