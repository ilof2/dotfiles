#!/bin/bash

if hyprctl clients -j | jq -e '.[] | select(.title == "term")' > /dev/null; then
    hyprctl dispatch 'hl.dsp.focus({window = "title:term"})'
else
    kitty --title "term"
fi
