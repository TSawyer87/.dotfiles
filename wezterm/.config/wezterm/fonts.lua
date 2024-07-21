local wezterm = require("wezterm")

local Fonts = {}

function Fonts.setup(config)
	config.font = wezterm.font_with_fallback({
		"MesloLGS NF",
		"JetBrainsMonoNL Nerd Font",
	})
	config.font_size = 16.0
	config.underline_thickness = "200%"
	config.underline_position = "-3pt"
	config.adjust_window_size_when_changing_font_size = false
	config.window_frame = {
		font = wezterm.font({ family = "JetBrainsMono Nerd Font" }),
		font_size = 12.0,
	}
end

return Fonts
