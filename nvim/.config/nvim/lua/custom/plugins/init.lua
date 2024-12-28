return {
    -- { "pipoprods/nvm.nvim",          config = true }, -- load the nvm path for neovim

    -- Dependencies for multiple modules
    { "nvim-lua/plenary.nvim",       lazy = true },
    { "nvim-tree/nvim-web-devicons", lazy = true },

    -- Automatic tabs detection
    'tpope/vim-sleuth',

    -- Special Comments
    {
        "folke/todo-comments.nvim",
        lazy = false,
        opts = { signs = false },
    },

    -- Block Comments
    {
        "numToStr/Comment.nvim",
        lazy = false,
        opts = {},
    },
}

-- TODO:
--  0       nvim :tutor
--  1       configure telescope
--  1.5     add keymap for todo quicklist to telescope
--  2       filepath in the status line
--  3       indentation keymap
--  4       git setup (commit tree, status) using lazygit integrated with snacks.nvim


-- ? neogen (documentation)
-- ? noice
-- debugger
-- diagnostics
-- multi cursor
