#!/usr/bin/python

import yaml
import colorsys
import subprocess
import os

icons = {
    "4d4d4d": "black",
    "5677fc": "blue",
    "795548": "brown",
    # "44475a": "dracula",
    "66bb6a": "green",
    "bdbdbd": "grey",
    "16a085": "manjaro",
    "4d576a": "nord",
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

with open(os.path.expanduser('~/.cache/wal/colors.yml')) as f:
    colors = yaml.safe_load(f)
    accent = hex2rgb(colors["colors"]["color1"][1:])
    accent_hsv = colorsys.rgb_to_hsv(*accent)
    for icon in icons.keys():
        icon_rgb = hex2rgb(icon)
        icon_hsv = colorsys.rgb_to_hsv(*icon_rgb)
        diff_h = abs(icon_hsv[0] - accent_hsv[0])
        diff_s = abs(icon_hsv[1] - accent_hsv[1])
        diff_v = abs(icon_hsv[2] - accent_hsv[2])
        diff = diff_h * 10 + diff_s * 2 + diff_v
        diffs[diff] = icons[icon]
    lowest = -1
    for diff in diffs.keys():
        if lowest == -1 or diff < lowest:
            lowest = diff
    print("Colorscheme: " + diffs[lowest])
subprocess.run(["gsettings", "set", "org.gnome.desktop.interface", "icon-theme", "Tela-" + diffs[lowest]])
with open(os.path.expanduser('~/.config/qt6ct/qt6ct.conf.template'), 'r') as src:
    with open(os.path.expanduser('~/.config/qt6ct/qt6ct.conf'), 'w') as target:
        for line in src.read():
            target.write(line.replace('{icon_theme}', 'Tela-' + diffs[lowest]))

