#!/bin/bash

monitors=$(hyprctl monitors -j | jq '.[] | .name')

result=""

# Add monitors to result
while IFS= read -r monitor; do
  monitor=$(echo "$monitor" | tr -d '"') # Remove quotes from monitor name
  if [ -n "$result" ]; then
    result="${result}\n"
  fi
  result="${result}󰍹 ${monitor}"
done <<<"$monitors"

# Add region entry
if [ -n "$result" ]; then
  result="${result}\n"
fi
result="${result}󰒉 Selection Region"

selection=$(echo -e "$result" | rofi -dmenu -i -selected-row 1 -p "Share list")


if [[ $selection == *"󰍹"* ]]; then
  monitor=$(echo "$selection" | cut -f2 --delimiter=" ")
  echo "[SELECTION]/screen:${monitor}"
elif [[ $selection == *"󰒉"* ]]; then
  region=$(slurp -f "%o@%x,%y,%w,%h")
  echo "[SELECTION]/region:${region}"
fi

