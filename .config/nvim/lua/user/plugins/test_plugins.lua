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
	{
		"danilamihailov/beacon.nvim",
		config = function()
			require("beacon").setup({
				enable = true,
				size = 40,
				fade = true,
				winblend = 0,
				minimal_jump = 10,
				show_jumps = true,
				focus_gained = false,
				shrink = true,
				timeout = 500,
				ignore_buffers = {},
				ignore_filetypes = {},
			})
		end,
	},
	-- { 'rcarriga/nvim-notify' },
	{ "glacambre/firenvim", build = ":call firenvim#install(0)", enabled = false },
}
