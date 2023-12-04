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
    d = {
        'd1' : '37172a0a-659d-4e8a-bbce-ff45b6ad949d',
        'd2' : '26deddc5-8238-4c45-93f9-f067f75c2f6c',
        'd3' : '026c750d-68bf-4144-a4d4-d967ab276b22',
        'd4' : '40de39d3-098e-48fe-a76a-91ebe6ad9f7d',
    }

    for rule in rules:

        if rule["name"] == "[General]": continue

        if rule["Description"] == "vs-code-insiders":                   # VS Code insiders (IDE)
            rule['size'] = '1920,767' if mode == 'work' else fullscreen     # adjust size
            rule['position'] = '1366,0' if mode == 'work' else '0,0'        # adjust position

        if rule["Description"] == 'betterbird-inbox':                   # Betterbird (mail browser)
            rule['desktoprule'] = "4" if mode == 'work' else '3'            # move to appropriate screen
            rule['position'] = '1366,0' if mode == 'work' else '0,0'        # adjust position
            rule['size'] = fullscreen                                       # adjust size

        if rule["Description"] == 'firefox':                            # Firefox (web browser)
            rule['desktops'] == d['d1'] if mode == 'work' else d['d3']      # adjust desktop

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