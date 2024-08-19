#!/bin/bash

OPTION="$(printf "1. Shutdown\n2. Reboot\n3. Logout\n4. Lock" | wofi -W 10% -H 15% -dp "Select...")"

if [ "$OPTION" = "1. Shutdown" ]; then
  ~/.local/bin/power/shutdown.sh
elif [ "$OPTION" = "2. Reboot" ]; then
  ~/.local/bin/power/reboot.sh
elif [ "$OPTION" = "3. Logout" ]; then
  ~/.local/bin/power/logout.sh
elif [ "$OPTION" = "4. Lock" ]; then
  ~/.local/bin/power/lock.sh
fi
