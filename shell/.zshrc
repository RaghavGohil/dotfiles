# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/TheLowEnd/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
###custom###

#for aesthics
eval "$(starship init zsh)"

#better cd
eval "$(zoxide init zsh)"

#thefuck (complete prev mistyped command)
eval "$(thefuck --alias)"

#aliases

#fastfetch
alias ff='fastfetch'

#show images (kitty)
alias icat='kitty +kitten icat'

#source
alias src='source'

#better listing 
alias ls='eza --icons'
alias ll='eza -l --icons'
alias la='eza -a --icons'

#better movement 
alias cd='z'
alias cdi='zi'
alias ..='cd ..' # type cd for ~

#better htop
#alias htop='btop'

#shortcuts
alias zshrc='nvim ~/.zshrc'
alias nvimconf='nvim ~/.config/nvim'

#better cat
alias cat='bat'

#git
alias gs='git status'
alias ga='git add'
alias grm='git rm'
alias gst='git stash'
alias gd='git diff'
alias gc='git commit'
alias gp='git push'
alias gl='git log'

export PATH=/opt/cuda/bin:$PATH
export LD_LIBRARY_PATH=/opt/cuda/lib64:$LD_LIBRARY_PATH
