return {
    "catppuccin/nvim",

    name = "catppuccin",

    priority = 1000,

    config = function()
        require("catppuccin").setup({
            flavour = "frappe",
            transparent_background = true,
            styles = {
                conditionals = {},
            },

            custom_highlights = function(color)
                return {
                    --NormalFloat = { fg = color.text, bg = color.mantle },
                    NormalFloat = { bg = color.crust },
                    Pmenu = { bg = color.crust },
                    PmenuSel = { fg = color.text, bg = color.surface0, style = { "bold" } },
                }
            end,
            integrations = {
                indent_blankline = {
                    enabled = true,
                    scope_color = "lavander",
                    colored_indent_levels = false,
                },
                mason = {
                    enabled = true,
                },
            },
        })

        vim.cmd.colorscheme("catppuccin")
    end,
}
