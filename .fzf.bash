# Setup fzf
# ---------
if [[ ! "$PATH" == */home/kamal/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/kamal/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/kamal/.fzf/shell/completion.bash"

# Key bindings
# ------------
source "/home/kamal/.fzf/shell/key-bindings.bash"
