---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local gcolor = require("gears.color")
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility



local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}
local color_palette = {
    rosewater = "#f5e0dc",
    flamingo = "#f2cdcd",
    pink = "#f5c2e7",
    mauve = "#cba6f7",
    red = "#f38ba8",
    maroon = "#eba0ac",
    peach = "#fab387",
    yellow = "#f9e2af",
    green = "#a6e3a1",
    teal = "#94e2d5",
    sky = "#89dceb",
    sapphire = "#74c7ec",
    blue = "#89b4fa",
    lavender = "#b4befe",
    text = "#cdd6f4",
    subtext0 = "#a6adc8",
    subtext1 = "#bac2de",
    overlay0 = "#6c7086",
    overlay1 = "#7f849c",
    overlay2 = "#9399b2",
    surface0 = "#313244",
    surface1 = "#45475a",
    surface2 = "#585b70",
    base = "#1e1e2e",
    mantle = "#181825",
    crust = "#11111b"
}
theme.color_palette = color_palette

-- theme.font         = "JetBrainsMono Nerd Font 10"
-- theme.taglist_font = "JetBrainsMono Nerd Font 10"
-- theme.font         = "Roboto Mono Nerd Font 10"
-- theme.taglist_font = "Roboto Mono Nerd Font 10"
-- theme.font = "Iosevka Nerd Font 10"
-- theme.taglist_font = "Iosevka Nerd Font 10"
theme.font = "CaskaydiaCode Nerd Font Mono 10"
theme.taglist_font = "CaskaydiaCode Nerd Font Mono 10"

theme.bg_normal    = color_palette.base
theme.bg_focus    = color_palette.base
theme.bg_urgent   = color_palette.base
theme.bg_minimize = color_palette.base
theme.bg_systray  = color_palette.base -- what does this do?

theme.fg_normal   = color_palette.overlay1
theme.fg_focus    = color_palette.mauve
theme.fg_urgent   = color_palette.red
theme.fg_minimize = "#ffffff"

theme.useless_gap   = dpi(4)
theme.border_width  = dpi(1)
theme.border_normal = color_palette.surface1
theme.border_focus  = color_palette.lavender

theme.border_marked = color_palette.peach

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
--local taglist_square_size = dpi(4)
--theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
--    taglist_square_size, theme.fg_focus
--)
--theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
--    taglist_square_size, theme.fg_normal
--)

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path .. "default/submenu.png"
theme.menu_height       = dpi(15)
theme.menu_width        = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = nil --themes_path .. "default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = nil --themes_path .. "default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path .. "default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path .. "default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = nil --themes_path .. "default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = nil -- themes_path .. "default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active   = nil -- themes_path .. "default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active    = nil -- themes_path .. "default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = nil -- themes_path .. "default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = nil -- themes_path .. "default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active   = nil -- themes_path .. "default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active    = nil -- themes_path .. "default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = nil -- themes_path .. "default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = nil -- themes_path .. "default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active   = nil -- themes_path .. "default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active    = nil -- themes_path .. "default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = nil -- themes_path .. "default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = nil -- themes_path .. "default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = nil -- themes_path .. "default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = nil -- themes_path .. "default/titlebar/maximized_focus_active.png"

theme.wallpaper = os.getenv("HOME") .. "/Pictures/wallpapers/dark-cat.png"
--theme.wallpaper = os.getenv("HOME") .. "/Pictures/wallpapers/darker_unicat.png"

-- You can use your own layout icons like this:
theme.layout_fairh      = themes_path .. "default/layouts/fairhw.png"
theme.layout_fairv      = themes_path .. "default/layouts/fairvw.png"
-- theme.layout_floating   = "/home/sv/pictures/Icons-AwesomeWM-Layouts-pastel/floating.png"
theme.layout_magnifier  = themes_path .. "default/layouts/magnifierw.png"
-- theme.layout_max        = "/home/sv/pictures/Icons-AwesomeWM-Layouts-pastel/max.png"
theme.layout_fullscreen = themes_path .. "default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path .. "default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path .. "default/layouts/tileleft.png"
-- theme.layout_tileleft   = "/home/sv/pictures/Icons-AwesomeWM-Layouts-pastel/tileleft.png"
theme.layout_tile       = themes_path .. "default/layouts/tilew.png"
theme.layout_tiletop    = themes_path .. "default/layouts/tiletopw.png"
theme.layout_spiral     = themes_path .. "default/layouts/spiralw.png"
theme.layout_dwindle    = themes_path .. "default/layouts/dwindlew.png"
theme.layout_cornernw   = themes_path .. "default/layouts/cornernww.png"
theme.layout_cornerne   = themes_path .. "default/layouts/cornernew.png"
theme.layout_cornersw   = themes_path .. "default/layouts/cornersww.png"
theme.layout_cornerse   = themes_path .. "default/layouts/cornersew.png"

-- theme.layout_archlogo = "/home/sv/pictures/Icons-AwesomeWM-Layouts-pastel/archlinux.png"


for _, value in ipairs { true, false } do
    beautiful.tasklist_plain_task_name = false
end

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80