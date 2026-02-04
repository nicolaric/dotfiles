require("vim-options")
require("config.lazy")

vim.lsp.enable({ "angularls", "lua_ls", "nxls", "ruff", "solargraph", "tailwindcss", "ts_ls", "ty" })

vim.keymap.set("n", "<leader>oi", "<cmd>TSOrganizeImports<CR>", { desc = "Organize Imports" })
vim.keymap.set("n", "<leader>ai", "<cmd>TSAddMissingImports<CR>", { desc = "Add Missing Imports" })
