local wezterm = require("wezterm")
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
local act = wezterm.action
local Keys = {}
-- you can put the rest of your Wezterm config here
function Keys.setup(config)
	smart_splits.apply_to_config(config, {
		-- the default config is here, if you'd like to use the default keys,
		-- you can omit this configuration table parameter and just use
		-- smart_splits.apply_to_config(config)

		-- directional keys to use in order of: left, down, up, right
		direction_keys = { "h", "j", "k", "l" },
		-- modifier keys to combine with direction_keys
		modifiers = {
			move = "CTRL", -- modifier to use for pane movement, e.g. CTRL+h to move left
			resize = "SHIFT", -- modifier to use for pane resize, e.g. META+h to resize to the left
		},
	})
	function recompute_padding(window)
		local window_dims = window:get_dimensions()
		local overrides = window:get_config_overrides() or {}

		if not window_dims.is_full_screen then
			if not overrides.window_padding then
				-- not changing anything
				return
			end
			overrides.window_padding = nil
		else
			-- Use only the middle 33%
			local third = math.floor(window_dims.pixel_width / 3)
			local new_padding = {
				left = third,
				right = third,
				top = 0,
				bottom = 0,
			}
			if overrides.window_padding and new_padding.left == overrides.window_padding.left then
				-- padding is same, avoid triggering further changes
				return
			end
			overrides.window_padding = new_padding
		end
		window:set_config_overrides(overrides)
	end

	wezterm.on("window-resized", function(window, pane)
		recompute_padding(window)
	end)

	wezterm.on("window-config-reloaded", function(window)
		recompute_padding(window)
	end)

	config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
	config.disable_default_key_bindings = false
	config.hyperlink_rules = wezterm.default_hyperlink_rules()
	config.mouse_bindings = {
		-- Ctrl-click will open the link under the mouse cursor
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	}
	config.keys = {
		-- send C-a when pressing C-a twice
		{ key = "a", mods = "LEADER", action = act.SendKey({ key = "a", mods = "CTRL" }) },
		{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },
		-- Pane keybinds
		{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		-- shift is for when caps lock is on
		{ key = "|", mods = "LEADER|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
		{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
		{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
		{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
		{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
		{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
		{ key = "s", mods = "LEADER", action = act.RotatePanes("Clockwise") },
		-- You can make separate keybindings for resizing panes
		-- but wezterm offers custom "mode" in the name of "KeyTable"
		{ key = "r", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
		-- Tab keybindings
		{ key = "n", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
		{ key = "[", mods = "LEADER", action = act.ActivateTabRelative(-1) },
		{ key = "]", mods = "LEADER", action = act.ActivateTabRelative(1) },
		{ key = "t", mods = "LEADER", action = act.ShowTabNavigator },
		-- Key table for moving tabs around
		{ key = "m", mods = "LEADER", action = act.ActivateKeyTable({ name = "move_tab", one_shot = false }) },
		-- Lastly, workspace
		{ key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
		{ key = "F11", mods = "NONE", action = act.ToggleFullScreen },
	}
	--
	-- I can use the tab navigator (LDR t), but I also want to quickly navigate tabs with index
	for i = 1, 9 do
		table.insert(config.keys, {
			key = tostring(i),
			mods = "LEADER",
			action = act.ActivateTab(i - 1),
		})
	end
	config.key_tables = {
		resize_pane = {
			{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
			{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
			{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
			{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
			{ key = "Escape", action = "PopKeyTable" },
			{ key = "Enter", action = "PopKeyTable" },
		},
		move_tab = {
			{ key = "h", action = act.MoveTabRelative(-1) },
			{ key = "j", action = act.MoveTabRelative(-1) },
			{ key = "k", action = act.MoveTabRelative(1) },
			{ key = "l", action = act.MoveTabRelative(1) },
			{ key = "Escape", action = "PopKeyTable" },
			{ key = "Enter", action = "PopKeyTable" },
		},
	}
end
-- return keys and mouse
return Keys
