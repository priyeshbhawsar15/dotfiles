-- Pull in the wezterm API
local wezterm = require("wezterm")
-- This will hold the configuration.
local config = wezterm.config_builder()
-- This is where you actually apply your config choices
-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("JetBrains Mono")
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.leader = { key = "q", mods = "ALT", timeout_milliseconds = 2000 }
config.keys = {
	{
		key = "f",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

-- config.wsl_domains = {
--   {
--     -- The name of this specific domain.  Must be unique amonst all types
--     -- of domain in the configuration file.
--     name = 'WSL:Ubuntu',
--
--     -- The name of the distribution.  This identifies the WSL distribution.
--     -- It must match a valid distribution from your `wsl -l -v` output in
--     -- order for the domain to be useful.
--     distribution = 'Ubuntu',
-- 	default_prog = { 'tmux', 'new', "-As0"},
--   },
-- }
-- config.default_domain = 'WSL:Ubuntu'
--

config.default_prog = { "tmux", "new", "-A", "-s", "dotfiles" }
local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- and finally, return the configuration to wezterm
return config
