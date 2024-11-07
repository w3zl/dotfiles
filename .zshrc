# Setup prompt
autoload -U colors && colors

function arch {
  echo -n "󰣇 "
}

PS1="%F{#9867c5}$(arch)%~%f %{$reset_color%}%{$reset_color%}${vcs_info_msg_0_}%{$reset_color%}"

# Aliases
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Key bindings
bindkey -e                              # emacs mode
bindkey  "^[[H"   beginning-of-line     # home
bindkey  "^[[F"   end-of-line           # end
bindkey "^[[1;5C" forward-word          # ctrl + ->
bindkey "^[[1;5D" backward-word         # ctrl + -<
autoload -U select-word-style && select-word-style bash

# Completion
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Plugins
plugins=(
	git
	zsh-autosuggestions
    sudo
)

# Default editor
export EDITOR="nvim"
export PATH="$PATH:$HOME/scripts"
if [[ -z "${SSH_CONNECTION}" ]]; then
    export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi

# fzf
bindkey -s ^f "lf\n"
