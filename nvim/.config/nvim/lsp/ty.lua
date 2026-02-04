return {
	init_options = { hostInfo = "neovim" },
	cmd = { "ty", "server" },
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
}
