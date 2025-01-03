---@type LazySpec
return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    opts = {
        flavour = "macchiato",
        transparent_background = false,
        integrations = {
            mason = true,
            snacks = true,
            blink_cmp = true,
            -- native_lsp = {
            --     enabled = true,
            --     virtual_text = {
            --         errors = { "italic" },
            --         hints = { "italic" },
            --         warnings = { "italic" },
            --         information = { "italic" },
            --         ok = { "italic" }
            --     },
            --     underlines = {
            --         errors = { "underline" },
            --         hints = { "underline" },
            --         warnings = { "underline" },
            --         information = { "underline" },
            --         ok = { "underline" }
            --     },
            --     inlay_hints = {
            --         background = true
            --     }
            -- },
        }
    },
    init = function()
        vim.cmd([[colorscheme catppuccin]])
    end
}
