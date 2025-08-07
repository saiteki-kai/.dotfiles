---@type LazySpec
return {
    "stevearc/conform.nvim",

    enabled = true,

    event = { "BufWritePre" },
    cmd = { "ConformInfo" },

    opts = {
        notify_on_error = false,
        lsp_fallback = true,

        formatters_by_ft = {
            -- lua = { "stylua" },
            python = { "ruff" },
            sh = { "shfmt" },
            css = { "prettier" },
        },

        format_on_save = {
            lsp_format = "fallback",
            timeout_ms = 500,
        },
    },
}
