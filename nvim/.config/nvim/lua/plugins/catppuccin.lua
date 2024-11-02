return {
    "catppuccin/nvim",
    nvim = "catppuccin",
    priority = 1000,
    config = function()
        local catppuccin = require("catppuccin")
        catppuccin.setup({
            transparent_background = true,
        })
        vim.cmd.colorscheme("catppuccin")
    end,
}
