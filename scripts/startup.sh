#!/usr/bin/env bash

i3-msg "workspace 1; append_layout /home/quizznor/.config/i3/layout-home.json"
kitty --config=$HOME/.config/kitty/kitty.ini &
conky --config=$HOME/.config/conky/todo.ini &
#i3-msg "workspace 11" > /dev/null &
#sleep 0.5
#i3-msg "workspace 1"
