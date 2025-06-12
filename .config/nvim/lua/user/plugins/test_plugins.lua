return {
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
	-- { 'rcarriga/nvim-notify', config= function ()
	--   vim.notify = require("notify")
	--
	-- end},
	{
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")
		end,
	},
	{ "glacambre/firenvim", build = ":call firenvim#install(0)", enabled = false },
	{
		"2kabhishek/nerdy.nvim",
		dependencies = {
			"folke/snacks.nvim",
		},
		cmd = "Nerdy",
	},
  {
      "OXY2DEV/markview.nvim",
      lazy = false,

      -- For blink.cmp's completion
      -- source
      -- dependencies = {
      --     "saghen/blink.cmp"
      -- },
  },
  {
      "nvzone/typr",
      dependencies = "nvzone/volt",
      opts = {},
      cmd = { "Typr", "TyprStats" },
  }
}
