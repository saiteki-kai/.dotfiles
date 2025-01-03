---@type LazySpec
return {
    {
        "williamboman/mason.nvim",
        opts = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
        }
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "lua_ls",
            },
        }
    },
    {
        "neovim/nvim-lspconfig",

    dependencies = {
        'saghen/blink.cmp',
        {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = {
                    "snacks.nvim",
                    { path = "lazy.nvim", words = { "Lazy" } },
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },

        config = function()
            -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local capabilities = require('blink.cmp').get_lsp_capabilities()

            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })

            lspconfig.lemminx.setup({
                capabilities = capabilities,
            })

            lspconfig.taplo.setup({
                capabilities = capabilities,
            })

            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
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
            })


            lspconfig.pyright.setup({
                capabilities = capabilities,
                settings = {
                    pyright = {
                        -- Using Ruff's import organizer
                        disableOrganizeImports = true,
                    },
                    python = {
                        analysis = {
                            -- Ignore all files for analysis to exclusively use Ruff for linting
                            ignore = { '*' },
                        },
                    },
                },
            })

            lspconfig.ruff.setup({
                capabilities = capabilities,
                trace = 'messages',
                init_options = {
                    settings = {
                        logLevel = 'debug',
                    }
                }
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if not client then
                        return
                    end

                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = args.buf,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                        end,
                    })
                end,
                desc = "Format on save"
            })

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client == nil then
                        return
                    end
                    if client.name == 'ruff' then
                        -- Disable hover in favor of Pyright
                        client.server_capabilities.hoverProvider = false
                    end
                end,
                desc = 'LSP: Disable hover capability from Ruff',
            })
        end
    },
}
