#!/bin/python

import sys, os

def read_rc(rc_location : str) -> list[dict] :

    rules = []

    with open(rc_location, "r") as rc:
        for line in rc.readlines():
            if line.startswith("["):
                rules.append({"name" : line.rstrip()})
            else:
                try:
                    key, value = line.rstrip().split("=")
                    rules[-1][key] = value
                except ValueError: continue

    return rules

def change_rules(rules : list[dict], mode : str) -> list[dict] :

    fullscreen = '1920,1200' if mode == 'work' else '1366,731'

    # if mode == "work":
    #     size = "1920, 767"
    #     position = "1366, 0"
    #     pos_quarter = '0, 0'
    #     size_quarter = '1366,767'
    #     fullscreen = '1920,1200'
    # elif mode == "home":
    #     size = "1366, 732"
    #     position = "0, 0"
    #     pos_quarter = '183,60'
    #     size_quarter = '1000,601'

    for rule in rules:

        if rule["name"] == "[General]": continue

        print(rule)

        if rule["Description"] == "IDE-window-settings":                # VS Code insiders (IDE)
            rule['size'] = '1920,767' if mode == 'work' else fullscreen     # adjust size

        if rule["Description"] == 'betterbird-inbox':                   # Betterbird (mail browser)
            rule['desktoprule'] = "4" if mode == '3'                        # move to appropriate screen
            rule['size'] = fullscreen                                       # adjust size

        # if rule["Description"]

        # if rule['name'] == '[1]':                                       # Betterbird editor
        #     rule['position'] = pos_quarter
        #     rule['size'] = size_quarter

        # if rule["name"] == "[ab3cf7f8-c176-4d0d-b392-9cf305ffc76e]":    # VSCode
        #     rule['position'] = position
        #     rule['size'] = size

        # if rule['name'] == '[4]':                                       # Betterbird browser
        #     rule['position'] = position
        #     rule['size'] = fullscreen


        # else:
        #     continue

    return rules

def write_rules(rc_location : str, rules : list[dict]) -> None :
    
    with open(rc_location, 'w') as rc:

        for rule in rules:
            for key, value in rule.items():
                if key == 'name':
                    rc.write(value + "\n")
                else: rc.write(f"{key}={value}\n")
            rc.write("\n")

window_rules = read_rc("/home/quizznor/.config/kwinrulesrc")
change_rules = change_rules(window_rules, sys.argv[1])
write_rules("/home/quizznor/.config/kwinrulesrc", change_rules)