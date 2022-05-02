### add to bash.rc
#if [ -f ~/.bash_aliases ]; then                                                                                       
#. ~/.bash_aliases                                                                                                     
#fi

alias la="ls -la"
alias vi="nvim"
alias vim="nvim"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' 
alias clip='xclip -selection c'
alias vpnip='ip -4 a show tun0'

export ipython="python -c 'import pty; pty.spawn(\"/bin/bash\")'"
#https://www.atlassian.com/git/tutorials/dotfiles
