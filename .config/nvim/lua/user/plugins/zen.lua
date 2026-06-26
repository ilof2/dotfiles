return {
	"folke/zen-mode.nvim",
	cmd = { "ZenMode" },
	keys = {
		{ "<leader><enter>", "<cmd>Zen<CR>" },
	},
	config = function(_, opts)
		require("zen-mode").setup(opts)
	end,
}
