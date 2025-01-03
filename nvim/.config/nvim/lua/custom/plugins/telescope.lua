---@type LazySpec
return {
    "nvim-telescope/telescope.nvim",

    event = "VimEnter",

    dependencies = {
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
    },   

    config = function()
        local builtin = require("telescope.builtin")

        require("telescope").setup({
            defaults = {
                prompt_prefix = "   ",
                -- NOTE: I use the cursor line to highlight the selection.
                -- WARN: I will think about multi-selection later.
                selection_caret = "  ",
                file_ignore_patterns = {
                    'node_modules',
                    '.git',
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                    theme = "ivy",
                },
                live_grep = {
                    hidden = true,
                    theme = "ivy",
                },
                git_files = {
                    theme = "ivy",
                },
            },
        })

        pcall(require('telescope').load_extension, 'fzf')

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
