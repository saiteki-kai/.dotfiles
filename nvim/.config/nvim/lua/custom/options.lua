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
-- opt.colorcolumn = "120"

-- Appearence
opt.guicursor = ""
opt.termguicolors = true
opt.showcmd = false
opt.showmode = false
opt.signcolumn = "yes"
opt.completeopt = "menuone,noinsert,noselect"
opt.cursorline = true
opt.winblend = 0
opt.pumblend = 10
opt.pumheight = 10
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Search
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"

-- Others
opt.hidden = true
opt.errorbells = false
opt.backup = false
opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.autochdir = false
opt.modifiable = true
opt.encoding = "utf-8"
opt.isfname:append("@-@")
opt.iskeyword:append("-")
opt.mouse:append("a")
opt.updatetime = 250
opt.timeoutlen = 300

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)

-- Netrw file explorer settings
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
