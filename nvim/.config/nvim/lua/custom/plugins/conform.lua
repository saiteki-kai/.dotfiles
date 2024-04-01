return {
    "stevearc/conform.nvim",

    event = { "BufWritePre" },

    cmd = { "ConformInfo" },

    keys = {
        {
            "<leader>f",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },

    opts = {
        format_on_save = { timeout_ms = 500, lsp_fallback = true },
    },

    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
