local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("i", "<C-c>", "<Esc>", opts)

-- Telescope
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, opts)
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, opts)
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, opts)
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, opts)
-- File browser
vim.keymap.set("n", "<leader>fe", function()
    require("telescope").extensions.file_browser.file_browser({
        path = "%:p:h",
        respect_gitignore = false,
    })
end, opts)

-- Null ls formatting
vim.api.nvim_set_keymap("n", "<leader>f", [[<cmd>lua vim.lsp.buf.format()<CR>]], opts)

-- Sidebar
vim.api.nvim_set_keymap("n", "<leader>o", [[<cmd>SidebarNvimToggle<CR>]], opts)

-- LSP
vim.api.nvim_set_keymap("n", "<leader>ld", [[<cmd>lua vim.lsp.buf.definition()<CR>]], opts)
vim.api.nvim_set_keymap("n", "<leader>lh", [[<cmd>lua vim.lsp.buf.hover()<CR>]], opts)
vim.api.nvim_set_keymap("n", "<leader>lr", [[<cmd>lua vim.lsp.buf.references()<CR>]], opts)
vim.api.nvim_set_keymap("n", "<leader>li", [[<cmd>lua vim.lsp.buf.implementation()<CR>]], opts)
vim.api.nvim_set_keymap("n", "<leader>ln", [[<cmd>lua vim.lsp.buf.rename()<CR>]], opts)

-- Markdown preview
vim.api.nvim_set_keymap("n", "<leader>mp", [[<cmd>MarkdownPreviewToggle<CR>]], opts)
