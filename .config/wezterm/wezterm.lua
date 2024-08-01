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

local leaderKey = ","

local tmuxLeaderKey = "\x14"

local escapeKey = "\x1b"

local combineKey = escapeKey .. leaderKey

-- For example, changing the color scheme:
-- config.color_scheme = "rose-pine"
-- config.color_scheme = "One Dark (Gogh)"

config.color_scheme = "Tokyo Night"
-- config.color_scheme = 'Tokyo Night'

-- config.font = wezterm.font("Menlo")
config.font = wezterm.font("Maple Mono", { weight = "Regular" })

-- config.font = wezterm.font("FiraCode Nerd Font Mono")
-- config.font = wezterm.font("JetBrainsMonoNL Nerd Font Mono")

config.harfbuzz_features = { "ss01", "cv01", "cv04=1", "cv03", "ss02", "ss03", "ss04" }

config.font_size = 16

config.window_decorations = "RESIZE"

-- config.enable_tab_bar = false

config.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = 0,
}
-- config.use_ime = false

-- macos blur
-- config.window_background_opacity = 0.9
-- config.macos_window_background_blur = 8

-- config.window_background_opacity = 0
-- config.macos_window_background_blur = 5

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
		key = "y",
		mods = "CTRL",
		action = wezterm.action.DisableDefaultAssignment,
	},

	{
		key = "m",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},

	-- switch zellij pane
	-- {
	-- 	key = "h",
	-- 	mods = "CMD",
	-- 	action = act.SendString(tmuxLeaderKey .. "h"),
	-- },
	-- {
	-- 	key = "j",
	-- 	mods = "CMD",
	-- 	action = act.SendString(tmuxLeaderKey .. "j"),
	-- },
	-- {
	-- 	key = "k",
	-- 	mods = "CMD",
	-- 	action = act.SendString(tmuxLeaderKey .. "k"),
	-- },
	--
	-- {
	-- 	key = "l",
	-- 	mods = "CMD",
	-- 	action = act.SendString(tmuxLeaderKey .. "l"),
	-- },

	--open nvim select text
	-- {
	-- 	key = "u",
	-- 	mods = "CMD",
	-- 	action = act.SendString("\x14u"),
	-- },
	-- {
	-- 	key = "Backslash",
	-- 	mods = "CMD",
	-- 	action = act.SendString(tmuxLeaderKey .. "v"),
	-- },
	-- {
	-- 	key = "s",
	-- 	mods = "CMD",
	-- 	action = act.SendString(tmuxLeaderKey .. "s"),
	-- },
	-- {
	-- 	key = "o",
	-- 	mods = "CMD",
	-- 	action = act.SendString(tmuxLeaderKey .. "f"),
	-- },
	--
	-- {
	-- 	key = "m",
	-- 	mods = "CMD",
	-- 	action = act.SendString(tmuxLeaderKey .. "m"),
	-- },

	{
		key = "e",
		mods = "CMD",
		action = act.SendString(tmuxLeaderKey .. "e"),
	},

	-- nvim Command
	-- {
	-- 	key = "1",
	-- 	mods = "CMD",
	-- 	action = act.SendString(combineKey .. "1"),
	-- },
	-- {
	-- 	key = "2",
	-- 	mods = "CMD",
	-- 	action = act.SendString(combineKey .. "2"),
	-- },
	-- {
	-- 	key = "3",
	-- 	mods = "CMD",
	-- 	action = act.SendString(combineKey .. "3"),
	-- },
	-- {
	-- 	key = "4",
	-- 	mods = "CMD",
	-- 	action = act.SendString(combineKey .. "4"),
	-- },
	-- {
	-- 	key = "5",
	-- 	mods = "CMD",
	-- 	action = act.SendString(combineKey .. "5"),
	-- },
	-- {
	-- 	key = "6",
	-- 	mods = "CMD",
	-- 	action = act.SendString(combineKey .. "6"),
	-- },
	-- {
	-- 	key = "7",
	-- 	mods = "CMD",
	-- 	action = act.SendString(combineKey .. "7"),
	-- },
	-- {
	-- 	key = "8",
	-- 	mods = "CMD",
	-- 	action = act.SendString(combineKey .. "8"),
	-- },
	-- {
	-- 	key = "9",
	-- 	mods = "CMD",
	-- 	action = act.SendString(combineKey .. "9"),
	-- },

	-- nvim editor
	{
		key = "n",
		mods = "CMD",
		action = act.SendString(combineKey .. "n"),
	},
	{
		key = "s",
		mods = "CMD",
		action = act.SendString(combineKey .. "fs"),
	},
	{
		key = "f",
		mods = "CMD",
		action = act.SendString(combineKey .. "sb"),
	},
	{
		key = "p",
		mods = "CMD",
		action = act.SendString(combineKey .. " "),
	},
	{
		key = "r",
		mods = "CMD",
		action = act.SendString(combineKey .. "sr"),
	},
	{
		key = "i",
		mods = "CMD",
		action = act.SendString(",gg"),
	},
	-- {
	-- 	key = "i",
	-- 	mods = "CMD",
	-- 	action = act.SendString(";lg"),
	-- },
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
		action = act.SendString(combineKey .. "bd"),
	},
	{
		key = "b",
		mods = "CMD",
		action = act.SendString(combineKey .. "e"),
	},
	{
		key = "e",
		mods = "CMD",
		action = act.SendString(combineKey .. "fb"),
	},

	-- zellij tab switch
	-- {
	-- 	key = "1",
	-- 	mods = "OPT",
	-- 	action = act.SendString(tmuxLeaderKey .. "1"),
	-- },
	-- {
	-- 	key = "2",
	-- 	mods = "OPT",
	-- 	action = act.SendString(tmuxLeaderKey .. "2"),
	-- },
	-- {
	-- 	key = "3",
	-- 	mods = "OPT",
	-- 	action = act.SendString(tmuxLeaderKey .. "3"),
	-- },
	-- {
	-- 	key = "4",
	-- 	mods = "OPT",
	-- 	action = act.SendString(tmuxLeaderKey .. "4"),
	-- },
	-- {
	-- 	key = "5",
	-- 	mods = "OPT",
	-- 	action = act.SendString(tmuxLeaderKey .. "5"),
	-- },
}
-- and finally, return the configuration to wezterm
return config
