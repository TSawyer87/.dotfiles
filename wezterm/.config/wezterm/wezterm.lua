-- Pull in the wezterm API
local wezterm = require("wezterm")
local tab = require("tab")
local fonts = require("fonts")
local keys = require("keys")
local kanagawa = require("themes.kanagawa")
local colors = require("colors.custom")

require("events.right-status").setup()
require("events.left-status").setup()
require("events.tab-title").setup()
require("events.new-tab-button").setup()

-- Pywal config
-- wezterm.add_to_config_reload_watch_list("home/emretuna/.wezterm.lua")
-- wezterm.add_to_config_reload_watch_list("home/emretuna/.cache/wal/wezterm-wal.toml")
-- config.color_scheme_dirs = { "/home/emretuna/.cache/wal" }
-- config.color_scheme = "Pywal"

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end
-- This module should set the appearance-related options.
-- Configurations
--
-- Set the Kanagawa theme as the default
config.colors = kanagawa
-- config.colors = colors
config.color_scheme = "Tokyo Night"
config.term = "wezterm"
config.warn_about_missing_glyphs = true
config.enable_scroll_bar = true
config.window_padding = {
	left = "0.5cell",
	right = "0cell",
	top = "1.50cell",
	bottom = "0cell",
}
config.scrollback_lines = 3000
config.automatically_reload_config = true
config.window_decorations = "INTEGRATED_BUTTONS"
config.debug_key_events = true

config.window_background_opacity = 0.9
-- config.text_background_opacity = 0.6
config.animation_fps = 60

config.initial_rows = 40
config.initial_cols = 110

config.enable_wayland = true
config.command_palette_rows = 14
config.debug_key_events = true
config.command_palette_bg_color = "#1a1b26"
config.command_palette_fg_color = "#959cbd"
config.check_for_updates = false

config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 800

-- and finally, return the configuration to wezterm
tab.setup(config)
fonts.setup(config)
keys.setup(config)
return config
