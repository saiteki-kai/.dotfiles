return {
    "nvim-lualine/lualine.nvim",

    lazy = false,

    opts = {
        options = {
            globalstatus = true,
            section_separators = "",
            component_separators = "",
            disabled_filetypes = { statusline = { "alpha", "snacks_dashboard" } },
        },
        sections = {
            lualine_a = {
                {
                    'mode',
                    fmt = function(mode)
                        return string.sub(mode, 1, 1)
                    end,
                },
            },
            lualine_b = { "branch", "diff" },
            lualine_c = { "diagnostics" },
            -- lualine_c = { "buffers" },
            -- lualine_c = {
            --     { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            -- },
            lualine_x = { 'filetype', 'encoding' },

        }
    },
}
