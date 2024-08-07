#!/bin/bash

cp ~/.cache/wal/kvantum.svg ~/.config/Kvantum/kvantum-pywal/kvantum-pywal.svg
cp ~/.cache/wal/kvantum.kvconfig ~/.config/Kvantum/kvantum-pywal/kvantum-pywal.kvconfig

kvantummanager --set kvantum-pywal &

