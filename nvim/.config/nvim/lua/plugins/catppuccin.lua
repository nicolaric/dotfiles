return {
	"catppuccin/nvim",
	nvim = "catppuccin",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("catppuccin")
	end,
}
