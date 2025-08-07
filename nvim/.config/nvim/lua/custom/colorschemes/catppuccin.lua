---@module "lazy"
---@type LazySpec
return {
    "catppuccin/nvim",
    name = "catppuccin",

    priority = 1000,
    lazy = true,

    build = ":CatppuccinCompile",

    ---@module "catppuccin"
    ---@type CatppuccinOptions
    opts = {
        float = {
            solid = true,
            transparent = true,
        },
        flavour = "macchiato",
        transparent_background = true,
        styles = {
            comments = { "italic" },
            strings = { "italic" },
            -- floats = "transparent",
            -- sidebars = "transparent",
        },
        auto_integrations = true,
        integrations = {
            mason = true,
            snacks = true,
            fidget = true,
            blink_cmp = true,
            copilot_vim = true,
        },
        custom_highlights = function(colors)
            local u = require("catppuccin.utils.colors")

            return {
                -- CursorLineNr = { bg = u.blend(colors.overlay0, colors.base, 0.75), style = { "bold" } },
                CursorLine = { bg = u.blend(colors.overlay0, colors.base, 0.50) },
            }
        end,
    },
    init = function()
        vim.cmd.colorscheme("catppuccin")
    end,
}
