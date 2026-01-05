#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias progresso='watch -d grep -e Dirty: -e Writeback: /proc/meminfo'

PS1='\[\e[38;5;117;1m\]\w\n\[\e[38;5;45m\]>\[\e[0m\] '

export EDITOR=nano
