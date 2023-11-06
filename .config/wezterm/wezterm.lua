-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "rose-pine"

config.font = wezterm.font("JetBrainsMonoNL Nerd Font Mono")

config.font_size = 16.0

config.window_decorations = "RESIZE"

config.enable_tab_bar = false

config.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = 0,
}
-- config.use_ime = false

-- macos blur
config.window_background_opacity = 0.4

config.macos_window_background_blur = 10

-- - { key: H, mods: Command, chars: "\x14h" }

local act = wezterm.action

config.keys = {
	-- Turn off the default CMD-m Hide action, allowing CMD-m to
	-- be potentially recognized and handled by the tab
	{
		key = "h",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},

	{
		key = "m",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},

	-- switch zellij pane
	{
		key = "h",
		mods = "CMD",
		action = act.SendString("\x14h"),
	},
	{
		key = "j",
		mods = "CMD",
		action = act.SendString("\x14j"),
	},
	{
		key = "k",
		mods = "CMD",
		action = act.SendString("\x14k"),
	},

	{
		key = "l",
		mods = "CMD",
		action = act.SendString("\x14l"),
	},

	--open nvim select text
	{
		key = "u",
		mods = "CMD",
		action = act.SendString("\x14u"),
	},
	{
		key = "Backslash",
		mods = "CMD",
		action = act.SendString("\x14v"),
	},
	{
		key = "s",
		mods = "CMD",
		action = act.SendString("\x14s"),
	},

	{
		key = "o",
		mods = "CMD",
		action = act.SendString("\x14f"),
	},

	{
		key = "m",
		mods = "CMD",
		action = act.SendString("\x14m"),
	},
	{
		key = "e",
		mods = "CMD",
		action = act.SendString("\x14e"),
	},

	-- nvim Command
	{
		key = "1",
		mods = "CMD",
		action = act.SendString("\x1b 1"),
	},
	{
		key = "2",
		mods = "CMD",
		action = act.SendString("\x1b 2"),
	},
	{
		key = "3",
		mods = "CMD",
		action = act.SendString("\x1b 3"),
	},
	{
		key = "4",
		mods = "CMD",
		action = act.SendString("\x1b 4"),
	},
	{
		key = "5",
		mods = "CMD",
		action = act.SendString("\x1b 5"),
	},
	{
		key = "6",
		mods = "CMD",
		action = act.SendString("\x1b 6"),
	},
	{
		key = "7",
		mods = "CMD",
		action = act.SendString("\x1b 7"),
	},
	{
		key = "8",
		mods = "CMD",
		action = act.SendString("\x1b 8"),
	},
	{
		key = "9",
		mods = "CMD",
		action = act.SendString("\x1b 9"),
	},

	{
		key = "n",
		mods = "CMD",
		action = act.SendString("\x1b n"),
	},
	{
		key = "f",
		mods = "CMD",
		action = act.SendString("\x1b sb"),
	},

	{
		key = "p",
		mods = "CMD",
		action = act.SendString("\x1b  "),
	},
	{
		key = "r",
		mods = "CMD",
		action = act.SendString("\x1b sr"),
	},
	{
		key = "i",
		mods = "CMD",
		action = act.SendString(";lg"),
	},
	{
		key = "a",
		mods = "CMD",
		action = act.SendString("ggVG"),
	},
	{
		key = "Slash",
		mods = "CMD",
		action = act.SendString("gcc"),
	},
	{
		key = "w",
		mods = "CMD",
		action = act.SendString(" bD"),
	},

	{
		key = "1",
		mods = "OPT",
		action = act.SendString("\x141"),
	},
	{
		key = "2",
		mods = "OPT",
		action = act.SendString("\x142"),
	},
	{
		key = "3",
		mods = "OPT",
		action = act.SendString("\x143"),
	},
	{
		key = "4",
		mods = "OPT",
		action = act.SendString("\x144"),
	},
}
-- and finally, return the configuration to wezterm
return config
