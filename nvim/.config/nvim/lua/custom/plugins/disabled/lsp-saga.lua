---@module "lazy"
---@type LazySpec
return {
    "nvimdev/lspsaga.nvim",
    enabled = false,

    event = "LspAttach",

    opts = {
        ui = {
            theme = "round",
            border = "rounded",
            devicon = true,
            title = true,
            winblend = 1,
        },
        symbol_in_winbar = {
            show_file = false,
            folder_level = 0,
            delay = 0,
        },
    },
}
