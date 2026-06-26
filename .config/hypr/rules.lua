hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

-- Custom --

-- # Don't allow idle on fullscreen windows
-- hl.window_rule({
-- 	name = "supress-idle-fullscreen",
-- 	match = { fullscreen = true },
-- 	idle = "fullscreen",
--   enabled = false
-- })

hl.window_rule({
	name = "game-first-workspace",
	match = { class = "^steam_app_[0-9]+$" },
	workspace = 1,
	fullscreen = true,
})

hl.window_rule({
	name = "cs-first-workspace",
	match = { class = "^cs2$" },
	workspace = 1,
	fullscreen = true,
})

hl.window_rule({
	name = "steam-workspace-four",
	match = { title = "Steam" },
	workspace = 4,
})

hl.window_rule({
	name = "zen-workspace-two",
	match = { class = "^zen$" },
	workspace = 2,
})

hl.window_rule({
	name = "tty-workspace-three",
	match = { title = "^term$" },
	workspace = 3,
})

-- # bluetui settings
hl.window_rule({
	name = "bluetui-center",
	match = { title = "^bluetui_term$" },
	float = true,
	center = true,
	size = { 700, 800 },
})

-- wiremix setting
hl.window_rule({
	name = "wiremix-center",
	match = { title = "^wiremix_term$" },
	float = true,
	center = true,
	size = { 1000, 700 },
})

-- spoty player
hl.window_rule({
	name = "spotify-player-workspace-five",
	match = { title = "^wiremix_term$" },
	workspace = 5,
})

-- btop setting
hl.window_rule({
	name = "btop-center",
	match = { title = "^btop_term$" },
	float = true,
	center = true,
	size = { 1200, 800 },
})

hl.window_rule({
	name = "calc",
	match = { title = "^calc$" },
	float = true,
	center = false,
  move = {"monitor_w - (window_w + (window_w * 0.2))", "window_w * 0.15"},
  size = {"monitor_w * 0.15", "monitor_h * 0.15"},
})

-- Discord setting
hl.window_rule({
	name = "discord-workspace-five",
	match = { class = "discord" },
	workspace = 5,
})

hl.window_rule({
	name = "nautilus-opacity",
	match = { class = "^org.gnome.Nautilus$" },
	opacity = "0.9",
})

hl.window_rule({
	name = "game-opacity",
	match = { title = "^TaskBarHero$" },
  border_size = 0
})

hl.layer_rule({
	name = "fix-screenshot",
	match = { namespace = "selection" },
	animation = "popout",
})

-- 1 monitor
hl.workspace_rule({ workspace = "1", monitor = "DP-1", default = true })
for i = 2, 5 do
	hl.workspace_rule({ workspace = tostring(i), monitor = "DP-1" })
end

hl.workspace_rule({workspace = "special:scratchpad", layout = "scrolling", animation = "slidevert"})

-- 2 monitor
hl.workspace_rule({ workspace = "5", monitor = "DP-2", default = true })
for i = 6, 9 do
	hl.workspace_rule({ workspace = tostring(i), monitor = "DP-2" })
end

hl.window_rule({ match = { content = "game", fullscreen = true }, confine_pointer = true })
