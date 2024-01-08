if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
# plug "zsh-users/zsh-syntax-highlighting"
plug "marlonrichert/zsh-autocomplete"
plug "Aloxaf/fzf-tab"
plug "zdharma-continuum/fast-syntax-highlighting"
# plug "romkatv/powerlevel10k"
# plug "agnoster/agnoster-zsh-theme"
# eval "$(starship init zsh)"


export TERM=alacritty
export KEYTIMEOUT=5
# export MANPAGER="$(which nvim) +Man!"
# sourcing p10k.config
# [[ ! -f ~/.config/zsh//.p10k.zsh ]] || source ~/.config/zsh//.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# changing titlebar name
case "$TERM" in (rxvt|rxvt-*|st|st-*|*xterm*|(dt|k|E)term)
    local term_title () { print -n "\e]0;${(j: :q)@}\a" }
    precmd () {
      local DIR="$(print -P '[%c]')"
      term_title "$DIR" "st"
    }
    preexec () {
      local DIR="$(print -P '[%c]%#')"
      local CMD="${(j:\n:)${(f)1}}"
      #term_title "$DIR" "$CMD" use this if you want directory in command, below only prints program name
	  term_title "$CMD"
    }
  ;;
esac

# Load and initialise completion system
# autoload -Uz compinit
# compinit

bindkey -v

bindkey -M menuselect '^H' vi-backward-char
bindkey -M menuselect '^K' vi-up-line-or-history
bindkey -M menuselect '^L' vi-forward-char
bindkey -M menuselect '^J' vi-down-line-or-history

bindkey -M viins '^H' vi-backward-char
bindkey -M viins '^K' vi-up-line-or-history
bindkey -M viins '^L' vi-forward-char
bindkey -M viins '^J' vi-down-line-or-history

# Setting fd as the default source for fzf
# export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'

export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden'
export FZF_DEFAULT_OPTS='--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b,fg:#d0b979'
# export FZF_DEFAULT_OPTS='--no-height --color=pointer:#31304D,gutter:-1,info:#0dbc79,hl:#FF0000,hl+:#3b4252,fg:#C0C0C0,bg+:#B6BBC4'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'batcat --color=always --line-range :50 {}'"

export FZF_ALT_C_COMMAND='fd --type d . --color=never --hidden'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"

LS_COLORS='no=00;32:fi=00;32:di=01;34:ln=04;36:pi=40;33:so=01;35:bd=40;33;01:'
export LS_COLORS
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# customCol='no=01;32:fi=01;32:di=01;34:ln=04;36:pi=40;33:so=01;35:bd=40;33;01:'
# zstyle ':all-matches:*' list-colors ${(s.:.)customCol}


if [ $(command -v nvim) ]; then
	export EDITOR=$(which nvim)
	alias vim=$EDITOR
	alias v=$EDITOR
fi

export SUDO_EDITOR=$EDITOR
export VISUAL=$EDITOR

# MANPAGER
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"

# export FZF_DEFAULT_COMMAND='fd .'
# bindkey -s '^S' ' **^I'


# bindkey -M viins '^e' edit-command-line
# bindkey -M vicmd '^e' edit-command-line

# bindkey -M viins '^I' fzf-tab-complete
#	for zsh-autocomplete
#	cycle through completion
# bindkey '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
#	cycle in menu and go through completion
# bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
# bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
unsetopt nomatch
# ZSH_THEME="simple"
#
# !!<Tab>
# sudo !!<Tab>
# sudo !<number><Tab>
# history -10
# history +10 will show 10th history

# to manually source any plugin
# source ~/.config/zsh/fzf-tab.plugin.zsh

# moved all PATH to .zshenv
# export PATH=$PATH:/home/kamal/.local/bin/
# export PATH=$PATH:/home/kamal/.nvm/versions/node/v14.20.0/bin
# export PATH=$PATH:/home/kamal/.local/bin
# export PATH=$PATH:/home/kamal/.local/share/nvim/mason/bin
# export PATH=$PATH:/home/kamal/.local/bin
# export PATH=$PATH:/home/kamal/.cargo/bin
# export PATH=$PATH:/home/kamal/.local/bin
# export PATH=$PATH:/usr/local/sbin
# export PATH=$PATH:/usr/local/bin
# export PATH=$PATH:/usr/sbin
# export PATH=$PATH:/usr/bin
# export PATH=$PATH:/sbin
# export PATH=$PATH:/bin
# export PATH=$PATH:/usr/games
# export PATH=$PATH:/usr/local/games
# export PATH=$PATH:/snap/bin

# Load Angular CLI autocompletion.
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# zstyle ':completion:*:*:git:*' user-commands bare:'bare dotfiles git alias'

source <(ng completion script)
. "$HOME/.cargo/env"

alias zcon="vim ~/.config/zsh/.zshrc"
alias nano="vim"
alias vi="vim"
alias svim='sudo nvim'
alias la="exa -a --color=always --group-directories-first"
alias ls="exa --color=always --group-directories-first"
alias ll="exa -l --color=always --group-directories-first"
alias c='clear'
alias cp="cp -r"
alias rm="rm -rf"
alias t="tree"
alias q="exit"
alias snow="shutdown now"
alias rn="ranger"
alias -- -="cd -"
alias cpf="~/tcpl/copyfiles.sh"
alias ref="~/tcpl/revert.sh"
alias hs="history | grep"
alias mkcd='foo(){ mkdir -p "$1"; cd "$1" }; foo '
alias sql='mysql'
alias cat='batcat'
alias rg='rg -i'
alias lg='lazygit'
alias whe='pwd'
alias bare='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree ~'
alias grep='rg'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias nd='npm run dev'
alias na='npm run all'

# alias -- -v='--version'
#
