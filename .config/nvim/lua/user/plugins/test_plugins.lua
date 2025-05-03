return {
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		enabled = true,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader>ff", mode = { "n" }, "<cmd>Fzf files<cr>" },
			{ "<leader>fl", "<cmd>Fzf live_grep<cr>" },
			{ "<leader>fw", "<cmd>Fzf grep_curbuf<cr>" },
			{ "<leader>fs", "<cmd>Fzf resume<cr>" },
			{ "<leader>fg", "<cmd>Fzf live_grep_glob<cr>" },
			{ "<leader>fh", "<cmd>Fzf helptags<cr>" },
			{ "<leader>fd", "<cmd>Fzf lsp_document_diagnostics<cr>" },
			{ "<leader>F", "<cmd>Fzf<cr>" },
			-- quick search selected word --
			{ "<leader>f", mode = { "v" }, "<cmd>Fzf grep_visual<cr>" },

			-- show commits --
			{ "<leader>gb", mode = { "n" }, "<cmd>Fzf git_branches<CR>" },
		},
		config = function()
			-- calling `setup` is optional for customization
			--
			local actions = require("fzf-lua").actions
			require("fzf-lua").setup({
				"ivy",
				winopts = {
					-- height = 0.85, -- window height
					-- width = 1, -- window width
					preview = {
						delay = 150,
					},
				},
				files = {
					actions = {
						["ctrl-h"] = actions.toggle_hidden,
						["ctrl-i"] = actions.toggle_ignore,
						["ctrl-q"] = actions.file_sel_to_qf,
					},
					fd_opts = [[ --color=never --hidden --type f --type l --exclude .git --exclude venv/ --exclude .venv/ ]],
					rg_opts = [[--color=never --hidden --files -g "!.git" -g "!venv" -g "!.venv"]],
				},
			})
		end,
	},
	{
		"folke/zen-mode.nvim",
		cmd = { "ZenMode" },
		keys = {
			{ "<leader>z", "<cmd>Zen<CR>" },
		},
		config = function(_, opts)
			require("zen-mode").setup(opts)
		end,
	},
	-- {
	--   'pwntester/octo.nvim',
	--   requires = {
	--     'nvim-lua/plenary.nvim',
	--     'nvim-telescope/telescope.nvim',
	--     'nvim-tree/nvim-web-devicons',
	--   },
	--   config = function ()
	--     require"octo".setup()
	--   end
	-- },
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
	{
		"2kabhishek/nerdy.nvim",
		dependencies = {
			"folke/snacks.nvim",
		},
		cmd = "Nerdy",
	},
}
