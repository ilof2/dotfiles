return {
	{
		"ilof2/posterpole.nvim",
		lazy = false,
		priority = 1000,
		-- dir = "~/projects/posterpole.nvim",
		keys = {
			{ "<leader>tt", "<cmd>PosterpoleToggleBG<cr>" },
		},
		-- branch = "master",
		config = function()
			local posterpole = require("posterpole")
			-- Use it if you want use built-in colors
			-- local palette = vim.g.palette
			posterpole.setup({
				transparent = true,
				dim_inactive = false,
				selected_tab_highlight = false,
				custom_groups = {
					posterpole = {
						-- Comment = {fg = {hex = "#4C4C4C", cterm = 240}, bg = {hex = "#000FFF"}},
						-- Comment = {fg = palette.colors.mainBlack, bg = nil},
					},
				},
				lualine = {
					transparent = false,
				},
			})
			vim.g.colorscheme = "posterpole"
		end,
	},
}
