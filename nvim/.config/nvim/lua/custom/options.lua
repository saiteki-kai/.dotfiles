local opt = vim.opt

-- Tab
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Indentation
opt.autoindent = true
opt.smartindent = true
opt.breakindent = true
opt.wrap = false

-- Lines
opt.relativenumber = true
opt.number = true
opt.scrolloff = 10

-- Appearence
opt.guicursor = ""
opt.termguicolors = true
-- opt.background = "dark"
opt.signcolumn = "yes"
opt.completeopt = "menuone,noinsert,noselect"
-- opt.cursorline = true
opt.winblend = 0
opt.pumblend = 0

-- Search
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Others
opt.errorbells = false
opt.backup = false
opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.autochdir = true
opt.modifiable = true
opt.clipboard = "unnamedplus"
opt.encoding = "utf-8"
opt.isfname:append("@-@")
opt.iskeyword:append("-")
opt.mouse:append("a")
