local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local themes_path = "./layout"
local theme = {}

theme.font              = "Monsterrat 12"

--------------
--- COLORS ---
--------------

-- Pallete
theme.pallete = require("pallete")

-- Background
theme.bg_normal         = pallete.background
theme.bg_focus          = pallete.white
theme.bg_urgent         = pallete.cyan
theme.bg_minimize       = pallete.background
theme.bg_systray        = theme.bg_normal

-- Foreground
theme.fg_normal         = "#d4be98"
theme.fg_focus          = "#d4be98"
theme.fg_urgent         = "#d4be98"
theme.fg_minimize       = "#d4be98"

--------------------
--- LAYOUT ICONS ---
--------------------

theme.layout_tile       = os.getenv("HOME")..".config/awesome/theme/retro/layouts/tile.png"
theme.layout_floating   = os.getenv("HOME")..".config/awesome/theme/retro/layouts/floating.png"
