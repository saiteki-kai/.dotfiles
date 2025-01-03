---@type LazySpec
return {
    {
        'saghen/blink.cmp',

        version = 'v0.*',

        event = { 'InsertEnter' },
        dependencies = {
            'rafamadriz/friendly-snippets',
            -- "giuxtaposition/blink-cmp-copilot",
        },

        opts = {
            keymap = {
                preset = 'default',

                ['<Up>'] = { 'select_prev', 'fallback' },
                ['<Down>'] = { 'select_next', 'fallback' },

                ['<Enter>'] = { 'select_and_accept', 'fallback' }
            },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },

            completion = {
                -- ghost_text = { enabled = true },
            },

            signature = {
                enabled = true
            },

            sources = {
                default = { "lazydev", "lsp", "path", "snippets", "buffer" }, -- , "copilot" },
                cmdline = {},
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100
                    }
                    -- copilot = {
                    --     name = "copilot",
                    --     module = "blink-cmp-copilot",
                    --     score_offset = 100,
                    --     async = true,
                    -- },
                }
            }
        }
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
