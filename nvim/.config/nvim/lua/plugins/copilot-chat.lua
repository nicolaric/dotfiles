return {
	"CopilotC-Nvim/CopilotChat.nvim",
	dependencies = {
		{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
		{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
	},
	config = function()
		vim.keymap.set("n", "<Leader>po", ":CopilotChatOpen<CR>", {})
		vim.keymap.set("n", "<Leader>pe", ":CopilotChatExplain<CR>", {})
		vim.keymap.set("n", "<Leader>pr", ":CopilotChatReview<CR>", {})
		vim.keymap.set("n", "<Leader>pt", ":CopilotChatTest<CR>", {})

		local copilotChat = require("CopilotChat")
		copilotChat.setup({
			window = {
				width = 0.7,
				height = 0.7,
				relative = "editor",
				layout = "float",
			},
		})
	end,
}
