#!/usr/bin/python

import yaml
import colorsys
import subprocess

icons = {
    "4d4d4d": "black",
    "5677fc": "blue",
    "795548": "brown",
    "44475a": "dracula",
    "66bb6a": "green",
    "bdbdbd": "grey",
    "16a085": "manjaro",
    # "4d576a": "nord",
    "ff9800": "orange",
    "f06292": "pink",
    "7e57c2": "purple",
    "ef5350": "red",
    "fb8441": "ubuntu",
    "ffca28": "yellow"
}

diffs = {}

def hex2rgb(hex):
    return (int(hex[0:2], 16) / float(255), int(hex[2:4], 16) / float(255), int(hex[4:6], 16) / float(255))

with open('~/.cache/wal/colors.yml') as f:
    colors = yaml.safe_load(f)
    accent = hex2rgb(colors["colors"]["color1"][1:])
    print(accent)
    for icon in icons.keys():
        print(icon)
        icon_rgb = hex2rgb(icon)
        diff_r = abs(icon_rgb[0] - accent[0])
        diff_g = abs(icon_rgb[1] - accent[1])
        diff_b = abs(icon_rgb[2] - accent[2])
        diff = diff_r + diff_g + diff_b
        diffs[diff] = icons[icon]
    lowest = -1
    for diff in diffs.keys():
        print(str(lowest) + " " + str(diff))
        if lowest == -1 or diff < lowest:
            lowest = diff
    print("Colorscheme: " + diffs[lowest])
    subprocess.run(["gsettings", "set", "org.gnome.desktop.interface", "icon-theme", "Tela-" + diffs[lowest]])


