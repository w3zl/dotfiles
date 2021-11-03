# Setup prompt
##autoload -Uz promptinit
##promptinit

# Aliases
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

# History

HISTSIZE=300
SAVEHIST=300
HISTFILE=~/.zsh_history

# Movement Keys

bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Completion

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES

# Plugins
plugins=(
	git
	zsh-autosuggestions
)

# OhMyZsh
export ZSH="/home/w1ezl/.oh-my-zsh"
ZSH_THEME="apple"
source $ZSH/oh-my-zsh.sh

