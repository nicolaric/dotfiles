return {
    "christoomey/vim-tmux-navigator",
    vim.keymap.set("n", "<C-m>", "<cmd>TmuxNavigateLeft<CR>"),
    vim.keymap.set("n", "<C-n>", "<cmd>TmuxNavigateDown<CR>"),
    vim.keymap.set("n", "<C-e>", "<cmd>TmuxNavigateUp<CR>"),
    vim.keymap.set("n", "<C-i>", "<cmd>TmuxNavigateRight<CR>"),
}
