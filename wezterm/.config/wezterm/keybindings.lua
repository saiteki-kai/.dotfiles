local wezterm = require("wezterm")

local M = {}

function M.setup(config)
    local action = wezterm.action

    config.keys = {
        { key = 'V', mods = 'SHIFT|CTRL', action = action.PasteFrom 'Clipboard' },
        { key = 'V', mods = 'SHIFT|CTRL', action = action.PasteFrom 'PrimarySelection' },
    }
end

return M
