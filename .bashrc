#
# ~/.bashrc
#

export TERM=kitty

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# System variables & append scripts path to $PATH
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
alias job='job.sh'

# utilities
alias xev='keymode.sh'
alias latex-install='tllocalmgr'

# Keyboard layout & xev functionality
#function keymode { xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'; }
setxkbmap de
