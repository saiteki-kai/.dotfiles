---@type LazySpec
return {
    "folke/lazydev.nvim",
    lazy = true,
    ft = "lua",
    opts = {
        library = {
            "snacks.nvim",
            { path = "lazy.nvim",          words = { "Lazy" } },
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            unpack(vim.api.nvim_get_runtime_file('', true)),
        },
    },
}
