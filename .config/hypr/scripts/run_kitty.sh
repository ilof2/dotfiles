#!/bin/bash

if hyprctl clients -j | jq -e '.[] | select(.title == "kitty-term")' > /dev/null; then
    hyprctl dispatch focuswindow "title:kitty-term"
else
    kitty --title "kitty-term"
fi
