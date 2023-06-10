#
# ~/.bashrc
#

# USER CHANGES  ################################################

GPG_TTY="\`tty\`"

################################################################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
