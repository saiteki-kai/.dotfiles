---@module "lazy"
---@type LazySpec
return {
    {
        "williamboman/mason.nvim",

        lazy = false,

        ---@module "mason"
        ---@type MasonSettings
        opts = {
            ui = {
                border = "rounded",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",

        event = { "BufReadPre", "BufNewFile" },

        dependencies = {
            "saghen/blink.cmp",
            "williamboman/mason-lspconfig.nvim",
        },

        config = function()
            local lspconfig = require("lspconfig")

            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                require("blink.cmp").get_lsp_capabilities()
            )

            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer",
                },
                automatic_installation = false,
                handlers = {
                    function(server_name)
                        lspconfig[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,
                    ["lua_ls"] = function()
                        lspconfig.lua_ls.setup({
                            capabilities = capabilities,
                            settings = {
                                Lua = {
                                    runtime = { version = "LuaJIT" },
                                    workspace = {
                                        checkThirdParty = false,
                                    },
                                    diagnostics = {
                                        globals = { "vim" },
                                    },
                                    completion = {
                                        callSnippet = "Replace",
                                    },
                                },
                            },
                        })
                    end,
                },
            })

            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
                border = "rounded",
            })
            vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
                border = "rounded",
            })

            require("lspconfig.ui.windows").default_options.border = "rounded"

            -- lspconfig.rust_analyzer.setup({
            --     capabilities = capabilities,
            --     cmd = {
            --         "rustup",
            --         "run",
            --         "stable",
            --         "rust-analyzer",
            --     },
            --     settings = {
            --         ["rust-analyzer"] = {
            --             cargo = { allFeatures = true },
            --             checkOnSave = true,
            --             check = {
            --                 enable = true,
            --                 command = "clippy",
            --                 features = "all",
            --             },
            --         },
            --     },
            -- })

            -- lspconfig.pyright.setup({
            --     capabilities = capabilities,
            --     settings = {
            --         pyright = {
            --             -- Using Ruff's import organizer
            --             disableOrganizeImports = true,
            --         },
            --         python = {
            --             analysis = {
            --                 -- Ignore all files for analysis to exclusively use Ruff for linting
            --                 ignore = { '*' },
            --             },
            --         },
            --     },
            -- })
            --
            -- lspconfig.ruff.setup({
            --     capabilities = capabilities,
            --     trace = 'messages',
            --     init_options = {
            --         settings = {
            --             logLevel = 'debug',
            --         }
            --     }
            -- })

            --     vim.api.nvim_create_autocmd("LspAttach", {
            --         callback = function(args)
            --             local client = vim.lsp.get_client_by_id(args.data.client_id)
            --             if not client then
            --                 return
            --             end
            --
            --             vim.api.nvim_create_autocmd("BufWritePre", {
            --                 buffer = args.buf,
            --                 callback = function()
            --                     vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
            --                 end,
            --             })
            --         end,
            --         desc = "Format on save"
            --     })
            --
            --     vim.api.nvim_create_autocmd("LspAttach", {
            --         group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
            --         callback = function(args)
            --             local client = vim.lsp.get_client_by_id(args.data.client_id)
            --             if client == nil then
            --                 return
            --             end
            --             if client.name == 'ruff' then
            --                 -- Disable hover in favor of Pyright
            --                 client.server_capabilities.hoverProvider = false
            --             end
            --         end,
            --         desc = 'LSP: Disable hover capability from Ruff',
            --     })
            -- end
        end,
    },
}
