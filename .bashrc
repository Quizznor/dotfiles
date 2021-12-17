#
# ~/.bashrc
#

export TERM=kitty
export EDITOR=vim

# Reset polybar module upon updating system
alias up='yay -Syu && $HOME/.config/scripts/update-monitor.sh'

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
alias ..='cd ..'
alias ...='cd ../..'
alias status='git status'
alias cc='cd $HOME/.config'
alias ss='cd $HOME/.config/scripts'
alias gg='cd $HOME/git-repositories'
alias todo='todo.sh'
alias job='job.sh'

# Utilities
alias scan='scanimage --device "airscan:e0:Brother Scanner" --output-file'
alias print='lpr -P Brother-Drucker'
alias dl='python /home/quizznor/git-repositories/music/dl.py'
alias stream='mpv-playback.sh'
alias scr='autoscript.sh'
alias wrt='write.sh'
alias xev='keymode.sh'
alias ltx='tllocalmgr'
alias del='delete.sh'


# Keyboard layout & xev functionality
#function keymode { xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'; }
setxkbmap de
