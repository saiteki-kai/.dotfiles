---@module "lazy"
---@type LazySpec
return {
    "folke/lazydev.nvim",

    lazy = true,
    ft = "lua",

    ---@module "lazydev"
    ---@type lazydev.Config
    opts = {
        library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            -- unpack(vim.api.nvim_get_runtime_file('', true)),
        },
    },
}
