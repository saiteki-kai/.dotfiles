---@type LazySpec
return {
    -- Dependencies for multiple modules
    { "nvim-lua/plenary.nvim",       lazy = true },
    { "nvim-tree/nvim-web-devicons", lazy = true },

    -- Special Comments
    {
        "folke/todo-comments.nvim",
        event = { 'BufReadPost', 'BufNewFile' },
        opts = { signs = false },
    },

    -- Block Comments
    {
        "numToStr/Comment.nvim",
        event = { 'BufReadPost', 'BufNewFile' },
        opts = {},
    },
    { "stevearc/dressing.nvim", event = "VeryLazy" },
}

-- TODO:
--  0       nvim :tutor
--  1       configure telescope
--  1.5     add keymap for todo quicklist to telescope
--  2       filepath in the status line
--  3       indentation keymap
--  4       git setup (commit tree, status) using lazygit integrated with snacks.nvim
--  5       rewrite LSP configuration
--  6       refine completion with AI
--  7       formatting ?
--  8       multi cursor
--  9       debugger / diagnostics / quickfix lists
--  10      neogen (documentation generation)
