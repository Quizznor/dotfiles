#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Append scripts path to $PATH
export PATH="$HOME/.config/scripts:$PATH"


# Ricing
alias ls='ls -lis --color=auto'
PS1='[\u@\h \W]\$ '


# Dotfile management
alias config='/usr/bin/git --git-dir=/home/quizznor/.config/.git --work-tree=/home/quizznor/.config'

# Workflow
alias cc='cd $HOME/.config'
alias ss='cd $HOME/.config/scripts'
alias todo='todo.sh'

# Keyboard layout
setxkbmap de
