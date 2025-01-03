local branch = {
    "branch",
    icon = "",
}

local filetype = {
    "filetype",
    fmt = function(str)
        return str:gsub("^%l", string.upper)
    end
}

local encoding = {
    'o:encoding',
    fmt = string.upper,
}

local fileformat = {
    'fileformat',
    icons_enabled = false,
    -- File format like vscode
    fmt = function(str)
        if str == 'unix' then
            return 'LF'
        elseif str == 'dos' then
            return 'CRLF'
        elseif str == 'mac' then
            return 'CR'
        else
            return str -- fallback
        end
    end,
}

local filename = {
    "filename",
    path = 3,
}

local lsp = {
    icon = "",
    function()
        local empty_msg = 'none'

        local clients = vim.lsp.get_clients()

        if #clients == 0 then
            return empty_msg
        end

        local active_clients = {}
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes

            if filetypes and vim.tbl_contains(filetypes, vim.bo.filetype) then
                table.insert(active_clients, client.name)
            end
        end

        if #active_clients == 0 then
            return empty_msg
        else
            return table.concat(active_clients, ', ')
        end
    end,
}

---@type LazySpec
return {
    {
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
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
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
                lualine_b = { branch, "diff" },
                lualine_c = { "diagnostics", filename },
                lualine_x = { lsp, filetype, encoding, fileformat, },
            }
        },
    }
}
