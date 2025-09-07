#!/bin/bash
WALLS_DIR="${HOME}/Pictures/walls/live"
cacheDir="${HOME}/.cache/ilof/live${theme}"


rofi_command="rofi -dmenu -theme ${HOME}/.config/rofi/wallSelect.rasi -theme-str ${rofi_override}"
rofi_override="element-icon{size:${monitor_res}px;border-radius:0px;}"

if [ ! -d "${cacheDir}" ] ; then
    mkdir -p "${cacheDir}"
fi

# selected_wall=$(ls $WALLS_DIR | grep mp4 | rofi -dmenu --selected-row 1 -c --display-columns=1 -p "")

for video in "$WALLS_DIR"/*.mp4; do
	if [ -f "$video" ]; then
		thumb_filename=$(basename "$video" .mp4).jpg
			if [ ! -f "${cacheDir}/${thumb_filename}" ] ; then
                ffmpeg -ss 00:00:01 -i "$video" -frames:v 1 -vf "scale=1920:1080" "${cacheDir}/${thumb_filename}"
			fi
    fi
done
selected_wall=$(find "${WALLS_DIR}" -maxdepth 1  -type f \( -iname "*.mp4" \) -exec basename {} .mp4 \; | sort | while read -r A ; do  echo -en "$A\x00icon\x1f""${cacheDir}/"/"$A.jpg\n" ; done | $rofi_command)

[[ -n "$selected_wall" ]] || exit 1
pidof mpvpaper && killall mpvpaper
hyprctl dispatch exec $(mpvpaper -o "no-audio --loop" "*" ${WALLS_DIR}/${selected_wall}.mp4 > /dev/null 2>&1) &
