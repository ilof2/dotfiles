return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
    enabled = true,
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
    -- keys = {
    --   {"<leader>m", "<cmd>MarkdownPreviewToggle<cr>"}
    -- }
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {},
		dependencies = { "nvim-treesitter/nvim-treesitter"}, -- if you use the mini.nvim suite
    enabled = true,
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    keys = {
      {"<leader>m", "<cmd>RenderMarkdown buf_toggle<cr>"}
    },
		ft = { "markdown" },
		config = function()
			require("render-markdown").setup({
				backgrounds = {
					"RenderMarkdownH1Bg",
					"RenderMarkdownH2Bg",
					"RenderMarkdownH3Bg",
					"RenderMarkdownH4Bg",
					"RenderMarkdownH5Bg",
					"RenderMarkdownH6Bg",
				},
			})
		end,
	},
}
