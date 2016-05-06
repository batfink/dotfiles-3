##########################################
# Directory
##########################################
DOT=$HOME/.dotfiles


##########################################
# ANTIGEN
##########################################
source $HOME/.antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle git
antigen bundle supercrabtree/k
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen apply


##########################################
# ZSH SETTINGS
##########################################
# Disable auto update
DISABLE_AUTO_UPDATE="true"

# Disable auto title names
DISABLE_AUTO_TITLE="true"

# Display red dots while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Vim mode
[ -e "$DOT/plugins/vim.plugin.zsh" ] && source "$DOT/plugins/vim.plugin.zsh"

# Expand functions in the prompt
setopt prompt_subst

# Ignore duplicate history entries
setopt histignorealldups

# Automatically pushd
setopt auto_pushd
export dirstacksize=5

# Enable extended globbing
setopt EXTENDED_GLOB


##########################################
# FZF
##########################################
[ -e "$DOT/include/fzf" ] && source "$DOT/include/fzf"


##########################################
# ALIASES
##########################################
[ -e "$DOT/aliases" ] && source "$DOT/aliases"


##########################################
# ZSH ALIAS
##########################################
alias ze="vim $DOT/zshrc"
alias rf='unalias -m "*" && source ~/.zshrc'


##############################
# PROMPT
##############################
[ -e "$DOT/include/prompt" ] && source "$DOT/include/prompt"


##########################################
# PATH
##########################################
# Executables
export PATH=$DOT/bin:$PATH

# Haskell/Cabal
export PATH=$PATH:$HOME/.local/bin

# Go
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH:$GOPATH/bin

# Nvm
if [[ -s $HOME/.zprofile ]]; then
    source $HOME/.zprofile
else
    [[ -s $HOME/.nvm/nvm.sh ]] && bash $HOME/.nvm/nvm.sh
fi

# Clean up path
[ -e $DOT/script/cleanup_path.sh ] && source $DOT/script/cleanup_path.sh


##########################################
# Z
##########################################
if command -v brew >/dev/null 2>&1; then
    export _Z_DATA="/tmp/.z"
    touch /tmp/.z
    if [ -f $(brew --prefix)/etc/profile.d/z.sh ]; then
        source $(brew --prefix)/etc/profile.d/z.sh
    fi
fi


##########################################
# HUBSPOT
##########################################
[[ -s $HOME/.hsrc ]] && source $HOME/.hsrc
