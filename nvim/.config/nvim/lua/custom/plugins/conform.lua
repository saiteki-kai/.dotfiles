---@module "lazy"
---@type LazySpec
return {
    "stevearc/conform.nvim",

    event = { "BufWritePre" },
    cmd = { "ConformInfo" },

    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
        notify_on_error = false,
        lsp_fallback = true,

        formatters_by_ft = {
            lua = { "stylua" },
            python = { "ruff" },
        },

        format_on_save = {
            lsp_format = "fallback",
            timeout_ms = 500,
        },
    },
}
