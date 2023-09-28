-- Options
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.textwidth = 100

vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.autowriteall = true
vim.opt.swapfile = false
vim.opt.undofile = true

vim.opt.encoding = "utf-8"
vim.opt.fileformat = "unix"
vim.opt.hidden = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.opt.wildignore = { "__pycache__", "*.o", "*~", "*.pyc", ".sum" }

vim.opt.scrolloff = 10
vim.opt.laststatus = 3
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "120"
vim.opt.showmode = false
vim.opt.pumheight = 20
vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.opt.cmdheight = 0
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.autoindent = true
vim.opt.cindent = true

vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.backspace = "2"
vim.opt.joinspaces = false

vim.opt.clipboard:append("unnamedplus")  -- Use system clipboard

vim.o.completeopt = "menuone,noselect"
