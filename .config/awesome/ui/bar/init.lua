local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local xresources = beautiful.xresources
local dpi = xresources.apply_dpi

local wibox = require("wibox")

local wibar_height = dpi(50)
local widget_space = dpi(5)

local function mylayoutbox(s)
    return awful.widget.layoutbox {
        screen = s,
        buttons = {
            awful.button({ }, 1, function () awful.layout.inc( 1) end),
            awful.button({ }, 3, function () awful.layout.inc(-1) end),
            awful.button({ }, 4, function () awful.layout.inc( 1) end),
            awful.button({ }, 5, function () awful.layout.inc(-1) end),
        }
    }
end

local separator = wibox.widget {
    {
        forced_width = dpi(2),
        forced_height = wibar_height,
        shape = gears.shape.rectangle,
        color = beautiful.pallete.black,
        widget = wibox.widget.rectangle,
    },
    widget = wibox.container.margin,
    left = widget_space,
    right = widget_space,
}

local function get_bar(s)
    s.mywibar = awful.wibar {
        stretch = true,
        restrict_workarea = true,
        position = "top",
        ontop = false,
        visible = true,
        opacity = 0.85,
        type = "dock",
        height = wibar_height,
        screen = s,
    }

    s.mywibar:setup({
        {
            layout = wibox.layout.align.horizontal,
            {
                mylayoutbox(s),
                separator,
                layout = wibox.layout.fixed.horizontal,
            },
            nil,
            nil,
        }
    })
end

screen.connect_signal("request::desktop_decoration", function(s)
    get_bar(s)
end)
