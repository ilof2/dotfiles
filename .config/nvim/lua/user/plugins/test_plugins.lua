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
  {
			"rcarriga/nvim-notify",
      config = function ()
        vim.notify = require("notify")
      end
  },
	{ "glacambre/firenvim", build = ":call firenvim#install(0)", enabled = false },
	-- {
	-- 	"2kabhishek/nerdy.nvim",
	-- 	dependencies = {
	-- 		"folke/snacks.nvim",
	-- 	},
	-- 	cmd = "Nerdy",
	-- },
  {
    "uga-rosa/ccc.nvim",
    config = function ()
      require("ccc").setup({})
    end
  }
}
