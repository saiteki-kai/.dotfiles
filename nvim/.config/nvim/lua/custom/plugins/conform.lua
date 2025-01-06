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
        format_on_save = {
            lsp_format = "fallback",
            timeout_ms = 500,
        },
    },
}
