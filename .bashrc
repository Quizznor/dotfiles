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
alias pp="cd $HOME/projects"
alias cs="cd $HOME/.config/scripts"

# PhD stuff
export OFFLINE="/home/quizznor/projects/offline/68b50527/install/bin/this-auger-offline.sh"

################################################################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
