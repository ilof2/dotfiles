return {
	{
		"ilof2/posterpole.nvim",
		lazy = false,
		priority = 1000,
		dir = "~/projects/posterpole.nvim",
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
					transparent = true,
				},
			})
			vim.g.colorscheme = "posterpole"
			vim.cmd("colorscheme posterpole")
		end,
	},
  {
    "vague-theme/vague.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other plugins
    enabled = false,
    config = function()
      -- NOTE: you do not need to call setup if you don't want to.
      require("vague").setup({
        -- optional configuration here
        --
      })
      -- vim.cmd("colorscheme vague")
    end
  },
}

