require("vim-options")
require("config.lazy")

vim.lsp.enable({ "angularls", "lua_ls", "nxls", "ruff", "solargraph", "tailwindcss", "ts_ls" })

vim.keymap.set("n", "<leader>oi", "<cmd>TSOrganizeImports<CR>", { buffer = bufnr, desc = "Organize Imports" })
vim.keymap.set("n", "<leader>ai", "<cmd>TSAddMissingImports<CR>", { buffer = bufnr, desc = "Add Missing Imports" })
