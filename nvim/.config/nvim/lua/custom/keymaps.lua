vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highligh when copying text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Cycle buffers
-- vim.keymap.set("n", "<C-S-j", ":bprev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-k>", ":bnext<CR>", { noremap = true, silent = true })

-- LSP
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

-- Indent
vim.keymap.set("n", "<Tab>", ">0", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", "<0", { noremap = true, silent = true })
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })

-- Toggle terminal blur using Blur My Shell extension
vim.keymap.set("n", "<C-A-B>", ":silent exec '!toggle-terminal-blur'<CR>", { noremap = true, silent = true })
