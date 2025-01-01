return {
    "nvim-telescope/telescope.nvim",
    -- tag = "0.1.8",

    event = "VimEnter",

    dependencies = {
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
        -- "nvim-telescope/telescope-ui-select.nvim",
    },

    config = function()
        local builtin = require("telescope.builtin")

        require("telescope").setup({
            defaults = {
                prompt_prefix = "   ",
                -- NOTE: I use the cursor line to highlight the selection.
                -- WARN: I will think about multi-selection later.
                selection_caret = "  ",
            },
            pickers = {
                find_files = {
                    hidden = true,
                    theme = "ivy",
                    find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
                },
                live_grep = {
                    hidden = true,
                    theme = "ivy",
                },
                git_files = {
                    theme = "ivy",
                },
            },
            -- extensions = {
            --     ['ui-select'] = {
            --         require("telescope.themes").get_dropdown {},
            --         require('telescope.themes').get_ivy {},
            --     },
            -- },
        })

        pcall(require('telescope').load_extension, 'fzf')
        -- pcall(require('telescope').load_extension, 'ui-select')

        -- Custom keymaps
        vim.keymap.set("n", "<C-p>", builtin.find_files)
        vim.keymap.set("n", "<leader>fg", builtin.live_grep)
        vim.keymap.set("n", "<leader>gf", builtin.git_files)
        vim.keymap.set("n", "<leader>h", builtin.help_tags)
        vim.keymap.set("n", "<leader>c", function()
            builtin.find_files({
                cwd = vim.fn.stdpath("config")
            })
        end)
    end,
}
