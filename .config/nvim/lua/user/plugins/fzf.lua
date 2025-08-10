
return {
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
		{ "<leader>fi", "<cmd>Fzf grep_cword<cr>" },
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
			"telescope",
			winopts = {
				-- height = 0.85, -- window height
				-- width = 1, -- window width
				preview = {
					delay = 10,
				},
			},
			files = {
				actions = {
					["ctrl-h"] = actions.toggle_hidden,
					["ctrl-i"] = actions.toggle_ignore
				},
				fd_opts = [[ --color=never --hidden --type f --type l --exclude .git --exclude venv/ --exclude .venv/ ]],
				rg_opts = [[--color=never --hidden --files -g "!.git" -g "!venv" -g "!.venv"]],
			},
		})
	end,
}
