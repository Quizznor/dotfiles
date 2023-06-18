#
# ~/.bashrc
#

# USER CHANGES  ################################################

GPG_TTY="\`tty\`"
EDITOR=/usr/bin/nano

# Workflow
alias cc="cd $HOME/.config"
alias ss="cd $HOME/system"
alias ww="cd $HOME/latex"

################################################################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
