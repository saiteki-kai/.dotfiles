vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highligh when copying text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Cycle buffers
-- vim.keymap.set("n", "<C-S-j", ":bprev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-k>", ":bnext<CR>", { noremap = true, silent = true })
