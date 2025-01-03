---@type LazySpec
return {
    "folke/snacks.nvim",

    priority = 1000,

    lazy = false,

    ---@type snacks.Config
    opts = {
        -- Warning when opening large files
        bigfile = { enabled = true },
        -- Render file before loading plugins
        quickfile = { enabled = true },
        -- Smooth scrolling
        scroll = { enabled = true, },
        -- Highlight same tokens in the file
        words = { enabled = true },
        -- Dashboard setup
        -- PERF: could be moved in another file for better organization
        dashboard = {
            enabled = true,
            sections = {
                -- { section = "header", padding = 1 },
                { pane = 1, section = "startup", padding = 2 },
                { pane = 2, padding = 2 },
                { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                { pane = 1, section = "keys", gap = 1, padding = 1 },
            },
        },
        -- NOTE: I would like to exclude the first indent level
        indent = {
            enabled = true,
            animate = {
                enabled = false,
            },
        },
        notifier = {
            enabled = true,
            timeout = 5000,
            style = "fancy",
        },
        -- TODO: check possible config
        statuscolumn = { enabled = true },
        input = { enabled = false },
        scope = { enabled = false },
        lazygit = { enabled = true },
    },

    init = function ()
        vim.keymap.set("n", "<leader>gl", ":lua Snacks.lazygit.log()<CR>", { silent = true, noremap = true })
        vim.keymap.set("n", "<leader>go", ":lua Snacks.lazygit.open()<CR>", { silent = true, noremap = true })
    end
}
