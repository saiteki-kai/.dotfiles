---@module "lazy"
---@type LazySpec
return {
    "catppuccin/nvim",
    name = "catppuccin",

    priority = 1000,
    lazy = false,

    build = ":CatppuccinCompile",

    ---@module "catppuccin"
    ---@type CatppuccinOptions
    opts = {
        flavour = "macchiato",
        transparent_background = false,
        styles = {
            comments = { "italic" },
            strings = { "italic" },
            -- floats = "transparent",
            -- sidebars = "transparent",
        },
        integrations = {
            mason = true,
            snacks = true,
            fidget = true,
            blink_cmp = true,
        },
    },
    init = function()
        vim.cmd([[colorscheme catppuccin]])

        -- Remove background in floating windows (e.g. lazy, mason)
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
}
