---@type LazySpec
return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        compile_path = vim.fn.stdpath "cache" .. "/catppuccin",
        flavour = "macchiato",
        transparent_background = false,
        integrations = {
            mason = true,
            blink_cmp = true,
            indent_blankline = {
                enabled = true,
                scope_color = "lavander",
                colored_indent_levels = false
            },
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = { "italic" },
                    hints = { "italic" },
                    warnings = { "italic" },
                    information = { "italic" },
                    ok = { "italic" }
                },
                underlines = {
                    errors = { "underline" },
                    hints = { "underline" },
                    warnings = { "underline" },
                    information = { "underline" },
                    ok = { "underline" }
                },
                inlay_hints = {
                    background = true
                }
            },
            snacks = true
        }
    },
    init = function()
        vim.cmd([[colorscheme catppuccin]])
    end
}
