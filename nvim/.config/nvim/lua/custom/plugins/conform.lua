---@type LazySpec
return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        notify_on_error = false,
        format_on_save = {
            lsp_format = "fallback",
            timeout_ms = 500,
        },
    },
}
