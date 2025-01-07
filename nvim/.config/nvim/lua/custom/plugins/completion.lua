---@module "lazy"
---@type LazySpec
return {
    {
        "saghen/blink.cmp",

        version = "*",
        build = "cargo build --release",

        event = { "InsertEnter" },

        dependencies = {
            "rafamadriz/friendly-snippets",
            -- "giuxtaposition/blink-cmp-copilot",
        },

        ---@module "blink.cmp"
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = "default",

                ["<Up>"] = { "select_prev", "fallback" },
                ["<Down>"] = { "select_next", "fallback" },

                ["<Enter>"] = { "select_and_accept", "fallback" },
            },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
            },

            completion = {
                list = { selection = "auto_insert" },
                menu = {
                    border = "rounded",
                    draw = {
                        gap = 1,
                        padding = 1,
                        columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
                    },
                    winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
                },

                documentation = {
                    window = {
                        border = "rounded",
                        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
                    },
                    auto_show = true,
                    auto_show_delay_ms = 200,
                    update_delay_ms = 50,
                },
            },
            signature = {
                window = {
                    border = "rounded",
                    winhighlight = "Normal:None,FloatBorder:FloatBorder",
                },
            },

            sources = {
                default = { "lazydev", "lsp", "path", "snippets", "buffer" }, -- , "copilot" },
                cmdline = {},
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100,
                    },
                    -- copilot = {
                    --     name = "copilot",
                    --     module = "blink-cmp-copilot",
                    --     score_offset = 100,
                    --     async = true,
                    -- },
                },
            },
        },

        opts_extend = { "sources.default" },
    },
    -- {
    --     "zbirenbaum/copilot.lua",
    --
    --     lazy = true,
    --
    --     cmd = "Copilot",
    --     event = "InsertEnter",
    --
    --     opts = {
    --         -- suggestion = { enabled = false },
    --         -- panel = { enabled = false },
    --     }
    -- }
}
