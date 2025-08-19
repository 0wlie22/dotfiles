-- Leader keys
vim.g.mapleader = " " -- Set the leader key to space
vim.g.maplocalleader = " " -- Set the local leader key to space

-- File and buffer handling
vim.opt.autowrite = true -- Automatically write a file when leaving a buffer
vim.opt.autoread = true -- Automatically read a file when its content is changed outside of Vim
vim.opt.autowriteall = true -- Like 'autowrite', but also used when not quitting
vim.opt.swapfile = false -- Don't use a swapfile for the buffer
vim.opt.undofile = true -- Keep an undo file for changes
vim.opt.hidden = true -- Allow buffers to exist in the background

-- Encoding and file format
vim.opt.encoding = "utf-8" -- Set the character encoding
vim.opt.fileformat = "unix" -- Use Unix-style line endings

-- Search options
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true -- Override 'ignorecase' when search pattern has upper case characters
vim.opt.incsearch = true -- Show where the pattern matches as it is typed
vim.opt.hlsearch = false -- Don't highlight all search matches

-- File and directory ignore patterns
vim.opt.wildignore = { "__pycache__", "*.o", "*~", "*.pyc", ".sum", ".DS_Store" } -- Ignore these files in filename completion

-- Display options
vim.opt.number = true -- Enable line numbers
vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.textwidth = 100 -- Set the maximum width of text that is being inserted
vim.opt.scrolloff = 10 -- Keep 10 lines above and below the cursor when scrolling
vim.opt.laststatus = 3 -- Always display the status line
vim.opt.cursorline = true -- Highlight the screen line of the cursor
vim.opt.signcolumn = "yes" -- Always show the signcolumn
vim.opt.colorcolumn = "120" -- Highlight column 120
vim.opt.showmode = false -- Don't show the current mode
vim.opt.pumheight = 20 -- Set the maximum number of items to show in the popup menu
vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.opt.cmdheight = 1 -- Set the command-line height to 1
vim.opt.splitright = true -- Vertical splits will be to the right
vim.opt.splitbelow = true -- Horizontal splits will be below
vim.opt.list = true -- Show some invisible characters
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" } -- Set the characters to show in 'list' mode

-- Indentation options
vim.opt.autoindent = true -- Copy indent from current line when starting a new line
vim.opt.cindent = true -- Enable C program indenting
vim.opt.softtabstop = 4 -- Use 4 spaces for a tab
vim.opt.tabstop = 4 -- Number of spaces that a <Tab> in the file counts for
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
vim.opt.shiftround = true -- Round indent to multiple of 'shiftwidth'
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.backspace = "2" -- Allow backspacing over everything in insert mode
vim.opt.joinspaces = false -- Don't insert two spaces after '.', '?' and '!' with a join command

-- Clipboard options
vim.opt.clipboard:append("unnamedplus") -- Use system clipboard

-- Completion options
vim.o.completeopt = "menuone,noselect" -- Completion options
-- vim.o.wrap = false -- Don't wrap lines

-- Diagnostics configuration
vim.diagnostic.config({
	underline = true, -- Underline diagnostic lines
	signs = true, -- Show signs for diagnostics
	update_in_insert = false, -- Don't update diagnostics while in insert mode
	virtual_text = false, -- Don't show virtual text for diagnostics
})

vim.opt.ignorecase = true -- Ignore case in search patterns
vim.lsp.buf.format({ timeout_ms = 10000 }) -- Set a timeout for formatting})
