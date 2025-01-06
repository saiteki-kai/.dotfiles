---@module "lazy"
---@type LazySpec
return {
    'akinsho/bufferline.nvim',

    version = "*",

    enabled = false,

    config = function()
        require("bufferline").setup({
            options = {
                separator_style = "thick",
                -- numbers = "ordinal",
                indicator = {
                    style = 'none'
                },
                show_buffer_close_icon = false,
                show_close_icon = false,
                diagnostics = "nvim_lsp"
            }
        })
    end
}
