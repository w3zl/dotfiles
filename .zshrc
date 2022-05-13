# Setup prompt
##autoload -Uz promptinit
##promptinit

# Aliases
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

#PS1
autoload -U colors && colors
function toon {
  echo -n " ❥ "
}
PS1="%{$fg[yellow]%}$(toon)%{$reset_color%} %~/ %{$reset_color%}${vcs_info_msg_0_}%{$reset_color%}"

# History

HISTSIZE=300
SAVEHIST=300
HISTFILE=~/.zsh_history

# Key bindings
                                        # emacs key binding
bindkey  "^[[H"   beginning-of-line     # home
bindkey  "^[[F"   end-of-line           # end
bindkey "^[[1;5C" forward-word          # ctrl + ->
bindkey "^[[1;5D" backward-word         # ctrl + -<

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
)

# OhMyZsh
#export ZSH="/home/w1ezl/.oh-my-zsh"
#ZSH_THEME="apple"
#source $ZSH/oh-my-zsh.sh

# Default editor
export EDITOR="nvim"
