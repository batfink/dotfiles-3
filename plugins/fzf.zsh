# Setup fzf
# ---------
if [[ ! "$PATH" == */home/geekjuice/.fzf/bin* ]]; then
  export PATH="$PATH:/home/geekjuice/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/geekjuice/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/geekjuice/.fzf/shell/key-bindings.zsh"

