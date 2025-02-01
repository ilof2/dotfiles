return {
	{
		"ilof2/posterpole.nvim",
		lazy = false,
		priority = 1000,
		dir = "~/projects/posterpole.nvim",
		branch = "nightly",
		config = function()
			local posterpole = require("posterpole")
			posterpole.setup({
				transparent = false,
				colorless_bg = false,
				dim_inactive = false,
				selected_tab_highlight = false,
				brightness = 0,
				fg_saturation = 0,
				bg_saturation = 0,
        adaptive_brightness = {
          enabled = true,
        },
				colors = {
					posterpole = {},
				},
				lualine = {
					transparent = true,
				},
			})
			vim.cmd("colorscheme posterpole")

      -- Start timer on config update
      posterpole.setup_adaptive()
		end,
	},
}
