return {
	init_options = { hostInfo = "neovim" },
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	single_file_support = true,
	settings = {},
	root_dir = function(bufnr, on_dir)
		local root_markers = { "pyproject.toml" }
		root_markers = vim.fn.has("nvim-0.11.3") == 1 and vim.list_extend({}, { root_markers, { ".git" } })
			or vim.list_extend(root_markers, { ".git" })
		local project_root = vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()
		on_dir(project_root)
	end,
	on_attach = function(client, bufnr)
		vim.api.nvim_buf_set_keymap(
			bufnr,
			"n",
			"<leader>cro",
			"<cmd>RuffOrganizeImports<CR>",
			{ noremap = true, silent = true, desc = "Ruff: Organize Imports" }
		)
		vim.api.nvim_buf_set_keymap(
			bufnr,
			"n",
			"<leader>crl",
			vim.lsp.codelens.run,
			{ noremap = true, silent = true, desc = "Ruff: Run CodeLens" }
		)
	end,
}
