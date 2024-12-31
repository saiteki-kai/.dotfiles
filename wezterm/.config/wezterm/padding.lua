local wezterm = require("wezterm")

local M = {}

M.zero_padding = { top = 0, left = 0, right = 0, bottom = 0 }
M.default_padding = { top = 8, left = 8, right = 8, bottom = 8 }

function M.setup()
    -- Update padding when nvim is open
    --
    -- https://github.com/wez/wezterm/discussions/3839#discussioncomment-6123338
    wezterm.on("update-status", function(window, pane)
        local info = pane:get_foreground_process_info()

        if info == nil then
            return
        end

        if info.name == "nvim" or info.name == "tmux: client" then
            window:set_config_overrides({
                window_padding = M.zero_padding,
            })
        else
            window:set_config_overrides({
                window_padding = M.default_padding,
            })
        end
    end)
end

return M
