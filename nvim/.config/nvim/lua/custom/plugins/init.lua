---@module "lazy"
---@type LazySpec
return {
    -- Dependencies for multiple modules
    {
        "nvim-lua/plenary.nvim",
        lazy = true
    }, {
    "nvim-tree/nvim-web-devicons",
    lazy = true
}, -- Special comments
    {
        "folke/todo-comments.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            signs = false
        }
    }, -- Block comments
    {
        "numToStr/Comment.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {}
    }, -- Input ui
    -- {
    --     "stevearc/dressing.nvim",
    --     event = "VeryLazy"
    -- }
}
