local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local theme = {}

theme.wallpaper = os.getenv("HOME") .. "/.config/wallpapers/Arch_kiss.jpg"

theme.border_width = dpi(3)
theme.border_normal = "#000000"
theme.border_focus  = "#327bd1"
theme.border_marked = "#91231c"
theme.useless_gap = 0
theme.gap_single_client = false

theme.bg_normal     = "#222222"
theme.bg_focus      = "#535d6c"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.wibar_height = dpi(30)

return theme
