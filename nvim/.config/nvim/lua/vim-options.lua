vim.g.mapleader = " "
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set softtabstop=4")
vim.wo.number = true
vim.wo.relativenumber = true
vim.diagnostic.config({
	virtual_text = true,
	signs = true, -- keeps gutter signs
	underline = true,
	update_in_insert = false, -- optional: control when diagnostics update
})

function Map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- window movement
Map("n", "<C-h>", "<C-w>h")
Map("n", "<C-j>", "<C-w>j")
Map("n", "<C-k>", "<C-w>k")
Map("n", "<C-l>", "<C-w>l")
Map("n", "<C-d>", "<C-d>zz")
Map("n", "<C-u>", "<C-u>zz")

-- terminal
Map("n", "<C-h>", ":wincmd h<CR>")
Map("n", "<C-j>", ":wincmd j<CR>")
Map("n", "<C-k>", ":wincmd k<CR>")
Map("n", "<C-l>", ":wincmd l<CR>")

-- jump list
Map("n", "<leader>o", "<C-o>")
Map("n", "<leader>i", "<C-i>")

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})
vim.keymap.set("n", "<leader>cto", ":TSOrganizeImports<CR>", { noremap = true, silent = true })
