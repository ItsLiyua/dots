#!/bin/bash

cp ~/.cache/wal/kvantum-pywal.* ~/.config/Kvantum/kvantum-pywal/
kvantummanager --set kvantum-pywal

gradience-cli import -p ~/.cache/wal/gradience-pywal.json
gradience-cli apply -n pywal --gtk both

killall nautilus
