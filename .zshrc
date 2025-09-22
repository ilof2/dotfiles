# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# fpath+=~/.zfunc
# Node.js setup
export LDFLAGS="-L/opt/homebrew/opt/node@18/lib"
export CPPFLAGS="-I/opt/homebrew/opt/node@18/include"
export PATH=/opt/homebrew/opt/node@18/bin/:$PATH
# ------
# Zoxide
export PATH="/Users/ilof/.local/bin:$PATH"

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/Library/Python/3.9/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export MPV_HOME=/opt/homebrew/Cellar/mpv/
export PATH=MPV_HOME:$PATH


export MAGICK_HOME=/opt/homebrew/opt/imagemagick
export PATH=$MAGICK_HOME/bin:$PATH

export LS_COLORS="di=1;36:ln=1;35:so=1;33:pi=1;37:ex=1;31:bd=34;46:cd=34;47:su=30;41:sg=30;46:tw=30;43:ow=30;47"
export ZSH_SCRIPTS=$HOME/dotfiles/zsh
source $ZSH_SCRIPTS/settings.sh
source $ZSH_SCRIPTS/prompt.sh
source $ZSH_SCRIPTS/aliases.sh
source $ZSH_SCRIPTS/apps.sh
source $ZSH_SCRIPTS/keys.sh
source $ZSH_SCRIPTS/completion.sh

fastfetch
