local rfocus = function(search, exec)
	return function()
		hl.dispatch(hl.dsp.focus({ window = search }))
		local win = hl.get_active_window()
		if not win or (not string.match(search, win.title) and not string.match(search, win.class)) then
			hl.dispatch(hl.dsp.exec_cmd(exec))
		end
	end
end

local function toggle(pid, exec)
	local find_cmd = 'pidof "' .. pid .. '"'
	local kill_cmd = "killall " .. pid
	return find_cmd .. " && " .. kill_cmd .. " || " .. exec
end

-- Variables
local mainMod = "SUPER"

local fileManager = rfocus("title:files", "kitty --title=files -e yazi")
local browser = rfocus("class:zen", "zen-browser")
local menu = toggle("rofi", "rofi -show drun")
local menuCommands = toggle("rofi", "rofi -show run")
local menuCalc = toggle("qalc", "qalc")
local menuWalls = toggle("rofi", "~/.config/hypr/scripts/select_wallpaper.sh")
local menuLiveWalls = toggle("rofi", "~/.config/hypr/scripts/select_live_wallpaper.sh")
-- $menu = pidof "otter-launcher" && hyprctl dispatch focuswindow "title:floating-term" || kitty --title floating-term -e zsh -c "otter-launcher"
-- CMDs
local bluetui = "kitty --title=bluetui_term -e bluetui"
local wiremix_cmd = "kitty --title=wiremix_term -e wiremix -f 144"
local top = "kitty --title=btop_term -e btop"
local music_player = 'kitty --title "spotify_player" -e zsh -c "spotify_player"'
local calc_cmd = 'kitty --title "calc" -e zsh -c "qalc"'

local music_win = rfocus("title:spotify_player", music_player)
local discord = rfocus("class:discord", "discord --ozone-platform=wayland")
local steam = rfocus("class:steam", "steam")
local calc = toggle("qalc", calc_cmd)

local top_win = toggle("btop", top)
local wiremix_win = toggle("wiremix", wiremix_cmd)
local bluetui_win = toggle("bluetui", bluetui)
local telegram = rfocus("class:org.telegram.desktop", "Telegram")

hl.bind(mainMod .. " + SHIFT + CTRL + W", hl.dsp.exec_cmd('pidof "waybar" && killall waybar || waybar'))
-- hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + RETURN", rfocus("title:term", "kitty --title term"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + V", browser)
hl.bind(mainMod .. " + E", fileManager)
hl.bind(mainMod .. " + S", steam)
hl.bind(mainMod .. " + O", discord)
hl.bind(mainMod .. " + Y", telegram)

-- Utils
hl.bind(mainMod .. " + b", hl.dsp.exec_cmd(bluetui_win))
hl.bind(mainMod .. " + CTRL + delete", hl.dsp.exec_cmd(top_win))
hl.bind(mainMod .. " + p", hl.dsp.exec_cmd(wiremix_win))

-- Color picker
hl.bind(mainMod .. " + SHIFT + i", hl.dsp.exec_cmd("hyprpicker | wl-copy"))

-- Screenshots
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("grimblast --notify copy area"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("grimblast --notify save area"))

-- ROFI
hl.bind(mainMod .. " + SHIFT + Delete", hl.dsp.exec_cmd(menuCommands))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + SHIFT + space", hl.dsp.exec_cmd(calc))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd(menuWalls))
hl.bind(mainMod .. " + SHIFT + CTRL + F", hl.dsp.exec_cmd(menuLiveWalls))

-- Which key
hl.bind(mainMod .. " + comma", hl.dsp.exec_cmd("~/.cargo/bin/wlr-which-key"))
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd("~/.cargo/bin/wlr-which-key"))

-- Window state
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + C", hl.dsp.window.center({ action = "toggle" }))

hl.bind(mainMod .. " + Backspace", hl.dsp.exec_cmd("hyprlock"))

--Notifications
hl.bind(mainMod .. " + n", hl.dsp.exec_cmd("swaync-client -t -sw"))

-- Run edit in hyprland config directory
-- bind = $mainMod, code:60, exec, kitty --hold -e zsh -c "cd ~/.config/hypr/ && nvim"
hl.bind(mainMod .. " + SHIFT + P", music_win)

-- bind = $mainMod, J, togglesplit, # dwindle

-- Move focus with mainMod + vim keys
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + SHIFT + l", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + SHIFT + A", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ direction = "down" }))

hl.bind(mainMod .. " + ALT + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
	hl.bind("H", hl.dsp.window.resize({ x = 40, y = 0, relative = true }), { repeating = true })
	hl.bind("L", hl.dsp.window.resize({ x = -40, y = 0, relative = true }), { repeating = true })
	hl.bind("J", hl.dsp.window.resize({ x = 0, y = 40, relative = true }), { repeating = true })
	hl.bind("K", hl.dsp.window.resize({ x = 0, y = -40, relative = true }), { repeating = true })
	hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + x", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + x", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Focus steam game
hl.bind(mainMod .. " + G", hl.dsp.focus({ window = "class:^(steam_app_[0-9]+)$" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Globals
local obs_regex = "class:^(com\\.obsproject\\.Studio)$)"
hl.bind(mainMod .. " + F12", hl.dsp.pass({ window = obs_regex }))
hl.bind(mainMod .. " + F10", hl.dsp.pass({ window = obs_regex }))

-- Toggle monitor
-- bind=SUPER,F8, exec, hyprctl keyword monitor "DP-1,2560x1440@144,2560x0,1.0"
-- bind=SUPER,F7, exec, hyprctl keyword monitor "DP-1,3840x2160@120.00,2560x0,1.5"
