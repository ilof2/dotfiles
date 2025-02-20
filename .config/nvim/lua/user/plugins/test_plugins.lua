return {
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		enabled = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- calling `setup` is optional for customization
			require("fzf-lua").setup({})
		end,
	},
	{
		"folke/zen-mode.nvim",
		cmd = { "ZenMode" },
		config = function(_, opts)
			require("zen-mode").setup(opts)
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		enabled = false,
		config = function()
			require("lualine").setup({
				options = {
					theme = "posterpole",
				},
			})
		end,
	},
	-- { 'rcarriga/nvim-notify' },
	{ "glacambre/firenvim", build = ":call firenvim#install(0)", enabled = false },
}
