#!/usr/bin/env python

tasks_done = len(open("/home/quizznor/Documents/todone.txt").readlines())
tasks_open = open("/home/quizznor/Documents/todo.txt").readlines()
groups = ["[URGENT]","[MEDIUM]","[RELAX ]"]
colors = ["red", "yellow", "green"]
tasks_left = len(tasks_open)

print("\n\t  TODO LIST: %i OPEN, %i COMPLETED"%(tasks_left,tasks_done))
print("-"*48+"\n")

for i,group in enumerate(groups):
    for j,line in enumerate(tasks_open):
        if group in line:
            print(" ${color %s}"%(colors[i])+str(j+1).zfill(2)+" "+line.rstrip(),"$color")
    print("\n")

#for i,line in enumerate(tasks):
#    print(line)
#    for i,string in enumerate():
#        if(string in line):
#            print(str(i)+"  "+line)
            #tasks[j].append(str(i)+"   "+line)
