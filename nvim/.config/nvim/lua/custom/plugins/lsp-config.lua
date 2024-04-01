local function on_attach()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
end

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",

        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },

        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })

            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
                on_attach = on_attach,
                cmd = {
                    "rustup",
                    "run",
                    "stable",
                    "rust-analyzer",
                },
                settings = {
                    ["rust-analyzer"] = {
                        cargo = { allFeatures = true },
                        checkOnSave = true,
                        check = {
                            enable = true,
                            command = "clippy",
                            features = "all",
                        },
                    },
                },
            })

            lspconfig.yamlls.setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })
        end,
    },
}
