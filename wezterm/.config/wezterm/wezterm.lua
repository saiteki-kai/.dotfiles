-- Launch WezTerm in maximized mode without a titlebar.

local wezterm = require("wezterm")
local config = require("config")

-- Init rows and cols to have a smoother maximize animation.
config.initial_cols = 190
config.initial_rows = 51

require("padding").setup()
require("keybindings").setup(config)

wezterm.on('gui-startup', function()
    local tab, pane, window = wezterm.mux.spawn_window({})
    window:gui_window():maximize()
end)

return config
