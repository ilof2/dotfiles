return {
	"uga-rosa/ccc.nvim",
	enabled = true,
  keys = {
    {"<leader>tc", "<cmd>CccHighlighterToggle<cr>"}
  },
	config = function()
		require("ccc").setup({})
	end,
}
