### add to bash.rc
#if [ -f ~/.bash_aliases ]; then                                                                                       
#. ~/.bash_aliases                                                                                                     
#fi

alias ls='ls --color=auto'
alias la="ls -la"
alias nvim='nvim ~/.config/nvim/init.vim'
alias vi="/usr/bin/nvim"
alias vim="/usr/bin/nvim"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' 
alias clip='xclip -selection c'
alias vpnip='ip -4 a show tun0'
alias color='gcolor2 2>/dev/null &'
#https://www.atlassian.com/git/tutorials/dotfiles
