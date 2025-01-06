local mode = require("custom.plugins.lualine.components.mode")
local branch = require("custom.plugins.lualine.components.branch")
local filetype = require("custom.plugins.lualine.components.filetype")
local encoding = require("custom.plugins.lualine.components.encoding")
local filename = require("custom.plugins.lualine.components.filename")
local fileformat = require("custom.plugins.lualine.components.fileformat")
local lsp = require("custom.plugins.lualine.components.lsp")
local lazy = require("custom.plugins.lualine.components.lazy")
local mason = require("custom.plugins.lualine.components.mason")

---@module "lazy"
---@type LazySpec
return {
    "nvim-lualine/lualine.nvim",

    event = { 'BufReadPost', 'BufNewFile' },

    opts = {
        options = {
            globalstatus = true,
            section_separators = "",
            component_separators = "",
            disabled_filetypes = { statusline = { "alpha", "snacks_dashboard" } },
        },
        tabline = {
            lualine_a = {},
            lualine_b = { "buffers" },
            lualine_c = {},
            lualine_x = { "%S" },
            lualine_y = {},
            lualine_z = { lazy, mason.component },
        },
        sections = {
            lualine_a = { mode },
            lualine_b = { branch, "diff" },
            lualine_c = { "diagnostics", filename },
            lualine_x = { lsp, filetype, encoding, fileformat },
            lualine_y = { "searchcount", "progress" },
        },
    },
}
