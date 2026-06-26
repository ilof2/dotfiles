hl.monitor({
    output   = "DP-1",
    mode     = "2560x1440@144",
    position = "2560x0",
    scale    = "1.0",
})

hl.monitor({
    output   = "DP-2",
    mode     = "3840x2160@160.00Hz",
    position = "0x0",
    scale    = "1.5",
})

require("env")

require("config")
require("autostart")

require("keybinds")
require("rules")
