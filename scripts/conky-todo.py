#!/usr/bin/env python

tasks_done = len(open("/home/quizznor/documents/todone.txt").readlines())
tasks_open = open("/home/quizznor/documents/todo.txt").readlines()
groups = ["[TOP]","[MID]","[BOT]"]
colors = ["red", "yellow", "green"]
tasks_left = len(tasks_open)

print("\n\tTODO LIST: %i OPEN, %i COMPLETED"%(tasks_left,tasks_done))
print("-"*44+"\n")

for i,group in enumerate(groups):
    for j,line in enumerate(tasks_open):
        if group in line:
            print(" ${color %s}"%(colors[i])+str(j+1).zfill(2)+" "+line.rstrip(),"$color")
    print()
