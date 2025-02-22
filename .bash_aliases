### add to bash.rc
#if [ -f ~/.bash_aliases ]; then                                                                                       
#. ~/.bash_aliases                                                                                                     
#fi
if [ -f ~/.bash_aliases_private ]; then
    . ~/.bash_aliases_private
fi

function nvim() {
    if [[ -e $1 && ! -w $1 ]]; then
        echo -e "\033[31m $(ls -la $1)\033[0m"
        read -s -k -t 0.5 "?Use sudo dumbass."
        command sudo nvim "$@"
    else
        command nvim "$@"
    fi
}

lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}

alias shut='systemctl poweroff'
#alias line='wine /home/w3zl/.wine/drive_c/users/w1ezl/AppData/Local/LINE/bin/LineLauncher.exe'
alias ls='ls --color=auto'
alias la="ls -la"
#alias nvim='nvim ~/.config/nvim/init.vim'
#alias vi=nvim
alias vim=nvim
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' 
alias clip='wl-copy'
alias vpnip='ip -4 a show tun0'
#alias paru='paru --noconfirm'
#alias color='gcolor2 2>/dev/null &'
alias ipv4='echo "${curl -4 https://ifconfig.me} "'
alias steam='gamescope -e -W 1920 -H 1080 -r 240 -- steam'
alias hyprexec='hyprctl dispatch -- exec'
#https://www.atlassian.com/git/tutorials/dotfiles
