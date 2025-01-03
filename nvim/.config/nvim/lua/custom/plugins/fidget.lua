---@type LazySpec
return {
    "j-hui/fidget.nvim",

    event = { 'BufReadPre', 'BufNewFile' },

    opts = {
        progress = {
            display = {
                done_ttl = 10,
                done_icon = "󰄬",
            },
        },
        notification = {
            view = {
                stack_upwards = false,
            },
            window = {
                align = "top",
                y_padding = 0, -- number of cells
            },
        },
    },
}
