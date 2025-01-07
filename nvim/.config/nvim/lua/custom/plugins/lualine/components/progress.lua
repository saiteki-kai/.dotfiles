return {
    "progress",
    separator = " ",
    fmt = function(str)
        local lines = vim.api.nvim_buf_line_count(0)
        return str .. "/" .. lines
    end,
}
