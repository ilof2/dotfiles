return {
	{
		"ilof2/posterpole.nvim",
		lazy = false,
		priority = 1000,
		dir = "~/projects/posterpole.nvim",
		-- branch = "master",
		config = function()
			local posterpole = require("posterpole")
      -- Use it if you want use built-in colors
      -- local palette = vim.g.palette
			posterpole.setup({
				transparent = false,
				colorless_bg = false,
				dim_inactive = true,
				selected_tab_highlight = false,
				brightness = 0,
				fg_saturation = 0,
				bg_saturation = 0,
        adaptive_brightness = {
          enabled = true,
        },
				custom_groups = {
					posterpole = {
            -- Comment = {fg = {hex = "#4C4C4C", cterm = 240}, bg = {hex = "#000FFF"}},
            -- Comment = {fg = palette.colors.mainBlack, bg = nil},
          },
				},
				lualine = {
					transparent = true,
				},
			})
			vim.cmd("colorscheme posterpole-void")

      -- Start timer on config update
      posterpole.setup_adaptive()
		end,
	}
}
