local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-c>", "<Esc>", opts)

-- format file with null ls
vim.cmd([[
  function! FormatAndEcho()
    lua vim.lsp.buf.format()
    echohl MoreMsg
    echon "File formatted"
    echohl None
    sleep 400m
    redraw!
  endfunction
]])

vim.keymap.set("n", "<leader>f", ":call FormatAndEcho()<CR>", { noremap = true, silent = true })

local wk = require("which-key")

wk.register({
	-- File operations
	f = {
		name = "+file",
		f = { "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>", "Find File" },
		g = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", "Live Grep" },
		b = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "Buffers" },
		h = { "<cmd>lua require('telescope.builtin').help_tags()<CR>", "Help Tags" },
		e = {
			"<cmd>lua require('telescope').extensions.file_browser.file_browser({ path = '%:p:h', respect_gitignore = false })<CR>",
			"File Browser",
		},
	},
	o = { "<cmd>SidebarNvimToggle<CR>", "Toggle Sidebar" },
	-- LSP
	l = {
		name = "+lsp",
		d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
		h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
		r = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
		i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
		n = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
	},
	m = { name = "markdown", p = { "<cmd>MarkdownPreviewToggle<CR>", "Toggle Markdown Preview" } },
	-- Git
	g = {
		name = "+git",
		g = { "<cmd>Git<CR>", "Git" },
		p = { "<cmd>Git push<CR>", "Push" },
	},
	-- Copilot
	h = {
		name = "+copilot",
		h = { "<cmd>CopilotChatToggle<CR>", "Toggle Chat" },
		c = { "<cmd>CopilotChatCommitStaged<CR>", "Commit" },
	},
}, { prefix = "<leader>" })

-- Visual mode keybindings
wk.register({
	-- Copilot chat
	h = {
		name = "+copilot",
		o = { "<cmd>CopilotChatOptimize<CR>", "Optimize" },
		f = { "<cmd>CopilotChatFix<CR>", "Fix" },
		e = { "<cmd>CopilotChatExplain<CR>", "Explain" },
		r = { "<cmd>CopilotChatReview<CR>", "Review" },
		d = { "<cmd>CopilotChatDocs<CR>", "Documentation" },
		t = { "<cmd>CopilotChatTests<CR>", "Tests" },
		l = { "<cmd>CopilotChatFixDiagnostic<CR>", "Fix Diagnostic" },
	},
}, { prefix = "<leader>", mode = "v" })
