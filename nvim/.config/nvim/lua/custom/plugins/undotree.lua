---@type LazySpec
return {
    "mbbill/undotree",

    event = { 'BufReadPre', 'BufNewFile' },

    config = function()
        vim.keymap.set("n", "<leader>r", vim.cmd.UndotreeToggle)
    end,
}
