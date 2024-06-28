#
# ~/.bashrc
#

export PATH="$PATH:$HOME/.local/bin"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias wget='aria2c -x 16 -s 16'
alias neofetch='fastfetch'
alias tree='tree -C'

#package management
alias install="paru -Slq | fzf --multi --preview 'paru -Si {1}' | xargs -ro paru -S"
alias uninstall="paru -Qq | fzf --multi --preview 'paru -Qi {1}' | xargs -ro paru -Rcns"
alias update='paru -Syu --noconfirm'
PS1='[\u@\h \W]\$ '
