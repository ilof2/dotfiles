return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		enabled = true,
		config = function()
			require("lualine").setup({
				options = {
					theme = "posterpole",
				},
				sections = {
					lualine_x = {
						function()
							return require("direnv").statusline()
						end,
						"encoding",
						"fileformat",
						"filetype",
					},
				},
			})
		end,
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")
		end,
	},

	{ "glacambre/firenvim", build = ":call firenvim#install(0)", enabled = false },
	-- {
	-- 	"2kabhishek/nerdy.nvim",
	-- 	dependencies = {
	-- 		"folke/snacks.nvim",
	-- 	},
	-- 	cmd = "Nerdy",
	-- },
}
