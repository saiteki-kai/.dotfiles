---@module "lazy"
---@type LazySpec
return {
    {
        "saghen/blink.cmp",

        build = "cargo build --release",

        event = { "InsertEnter" },

        dependencies = { "rafamadriz/friendly-snippets", "fang2hou/blink-copilot" },

        ---@module "blink.cmp"
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = "default",

                ["<Up>"] = { "select_prev", "fallback" },
                ["<Down>"] = { "select_next", "fallback" },

                ["<Enter>"] = { "select_and_accept", "fallback" }
            },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono"
            },

            completion = {
                menu = {
                    auto_show = true,
                    draw = {
                        treesitter = { "lsp" },
                        gap = 1,
                        padding = 1,
                        columns = {
                            {
                                "label",
                                "label_description",
                                gap = 1
                            },
                            {
                                "kind_icon",
                                "kind",
                                gap = 1
                            }
                        },
                    },
                },

                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 500,
                }
            },
            signature = {
                enabled = true,
            },

            cmdline = {
                enabled = false
            },

            sources = {
                default = { --[[ "lazydev", ]] "lsp", "path", "snippets", "buffer", "copilot" },
                providers = {
                    -- lazydev = {
                    --     name = "LazyDev",
                    --     module = "lazydev.integrations.blink",
                    --     score_offset = 100
                    -- },
                    copilot = {
                        name = "copilot",
                        module = "blink-copilot",
                        score_offset = 100,
                        async = true
                    }
                }
            },

            fuzzy = {
                implementation = "prefer_rust_with_warning"
            }
        },

        opts_extend = { "sources.default" }
    }, {
    "github/copilot.vim",

    cmd = "Copilot",

    event = "BufWinEnter",

    init = function()
        vim.g.copilot_no_maps = true
    end,

    config = function()
        -- Block the normal Copilot suggestions
        vim.api.nvim_create_augroup("github_copilot", {
            clear = true
        })

        vim.api.nvim_create_autocmd({ "FileType", "BufUnload" }, {
            group = "github_copilot",
            callback = function(args)
                vim.fn["copilot#On" .. args.event]()
            end
        })

        vim.fn["copilot#OnFileType"]()
    end

}

}
