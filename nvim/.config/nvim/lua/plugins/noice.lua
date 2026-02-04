return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		local noice = require("noice")

		-- Optional: keep notify configured as fallback / in case you use the notify view somewhere
		require("notify").setup({
			background_colour = "#000000",
			-- These help if you ever use the "notify" view instead of mini
			top_down = false,
			anchor = "SE", -- bottom-right anchor
		})

		noice.setup({
			-- Route most things to mini (bottom-right small notifications)
			routes = {
				{
					filter = { event = "msg_show" },
					view = "mini",
				},
				{
					filter = { event = "msg_showmode", any = { { find = "recording" } } },
					view = "mini",
				},
				-- You can add more routes here if needed (e.g. search_count → mini or virtualtext)
			},

			-- Customize mini to appear bottom-right
			views = {
				mini = {
					backend = "mini",
					relative = "editor",
					position = {
						row = "100%", -- bottom of screen
						col = "100%", -- right edge
					},
					anchor = "SW", -- ← key change: South-East = bottom-right corner
					align = "right", -- text alignment inside the bubble
					size = "auto",
					border = {
						style = "rounded",
					},
					win_options = {
						winblend = 10,
						winhighlight = {
							Normal = "NoiceMini",
							FloatBorder = "NoiceMiniBorder",
						},
					},
				},
			},

			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
			},
		})
	end,
}
