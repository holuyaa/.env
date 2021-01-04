# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/holu/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/holu/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/holu/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/holu/.fzf/shell/key-bindings.zsh"
