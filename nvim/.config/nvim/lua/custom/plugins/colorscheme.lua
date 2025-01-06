---@module "lazy"
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
            fidget = true,
            blink_cmp = true,
        }
    },
    init = function()
        vim.cmd([[colorscheme catppuccin]])
    end
}
