---@type LazySpec
return {
    -- Dependencies for multiple modules
    { "nvim-lua/plenary.nvim",       lazy = true },
    { "nvim-tree/nvim-web-devicons", lazy = true },

    -- Special comments
    {
        "folke/todo-comments.nvim",
        event = { 'BufReadPost', 'BufNewFile' },
        opts = { signs = false },
    },

    -- Block comments
    {
        "numToStr/Comment.nvim",
        event = { 'BufReadPost', 'BufNewFile' },
        opts = {},
    },

    -- Input ui
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy"
    },
}

-- TODO:
--  1       configure telescope
--  2       add keymap for quickfix
--  3       rewrite LSP configuration
--  4       formatting ?
--  5       multi cursor
--  6       debugger / diagnostics / quickfix lists
--  7       refine completion with AI
--  8      neogen (documentation generation)
