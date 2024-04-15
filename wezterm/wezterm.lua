local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "DanQing (base16)"
config.font = wezterm.font("Comic Mono")
config.font_size = 14.0
config.use_fancy_tab_bar = true

config.colors = {
	foreground = "silver",
	background = "black",

	cursor_bg = "#f4a261",
	cursor_fg = "black",
	cursor_border = "#f4a261",

	selection_fg = "black",
	selection_bg = "#a87f5b",

	scrollbar_thumb = "#433c32",
	split = "#433c32",

	ansi = { "#362b00", "#cc241d", "#98971a", "#d79921", "#458588", "#b16286", "#689d6a", "#a89984" },
	brights = { "#7c6f64", "#fb4934", "#b8bb26", "#fabd2f", "#83a598", "#d3869b", "#8ec07c", "#ebdbb2" },

	compose_cursor = "orange",
	copy_mode_active_highlight_bg = { Color = "#3c3836" },
	copy_mode_active_highlight_fg = { AnsiColor = "Black" },
	copy_mode_inactive_highlight_bg = { Color = "#a89984" },
	copy_mode_inactive_highlight_fg = { AnsiColor = "White" },

	quick_select_label_bg = { Color = "peru" },
	quick_select_label_fg = { Color = "#ffffff" },
	quick_select_match_bg = { AnsiColor = "Navy" },
	quick_select_match_fg = { Color = "#ffffff" },

	tab_bar = {
		background = "#3a3228",
		active_tab = {
			bg_color = "#504945",
			fg_color = "#ebdbb2",
		},
		inactive_tab = {
			bg_color = "#3a3228",
			fg_color = "#928374",
		},
		inactive_tab_hover = {
			bg_color = "#4d4440",
			fg_color = "#bdae93",
			italic = false,
		},
		new_tab = {
			bg_color = "#3a3228",
			fg_color = "#928374",
		},
		new_tab_hover = {
			bg_color = "#4d4440",
			fg_color = "#bdae93",
			italic = false,
		},
	},
}

config.inactive_pane_hsb = {
	saturation = 0.8,
	brightness = 0.7,
}

config.window_background_opacity = 0.95
config.text_background_opacity = 1.0

local mod = "CMD" -- I am using a mac

config.keys = {
	{
		key = "a",
		mods = mod,
		action = wezterm.action.ToggleFullScreen,
	},
	{
		key = "c",
		mods = mod,
		action = wezterm.action.CopyTo("Clipboard"),
	},
	{
		key = "v",
		mods = mod,
		action = wezterm.action.PasteFrom("Clipboard"),
	},

	{
		-- split vertically
		key = "d",
		mods = mod,
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		-- split horizontally
		key = "D",
		mods = mod .. "|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "w",
		mods = mod,
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},

	{
		key = "h",
		mods = mod,
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = mod,
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = mod,
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = mod,
		action = wezterm.action.ActivatePaneDirection("Down"),
	},

	{
		key = "H",
		mods = mod .. "|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "L",
		mods = mod .. "|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "K",
		mods = mod .. "|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "J",
		mods = mod .. "|SHIFT",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},

	{
		key = "Escape",
		mods = "CTRL",
		action = wezterm.action.ShowDebugOverlay,
	},
}

return config

