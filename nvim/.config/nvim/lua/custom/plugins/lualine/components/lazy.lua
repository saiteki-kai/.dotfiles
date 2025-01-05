local get_update_count = function()
    return "󰒲 " .. #require("lazy.manage.checker").updated
end

return {
    get_update_count,
    -- require("lazy.status").updates,
    -- cond = require("lazy.status").has_updates,
    on_click = function()
        vim.cmd("Lazy")
    end,
}
