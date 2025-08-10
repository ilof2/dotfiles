return {
	"neovim/nvim-lspconfig",
	-- event = { "BufReadPre", "BufNewFile" },
	lazy = false,
	enabled = true,
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
		-- 'saghen/blink.cmp',
	},
	config = function(_, lsp_opts)
		local setup_service = function(server_name, filetypes)
			local original_capabilities = vim.lsp.protocol.make_client_capabilities()
			-- local capabilities = require('blink.cmp').get_lsp_capabilities(original_capabilities)
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = cmp_nvim_lsp.default_capabilities(original_capabilities)
			if server_name == "rust_analyzer" then
				require("lspconfig")[server_name].setup({
					settings = {
						["rust-analyzer"] = {
              cargo = { allFeatures = true},
            },
					},
					capabilities = capabilities,
					filetypes = filetypes,
					-- on_attach = function(client, bufnr)
					-- 	require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
					-- end,
				})
				return
			end
			require("lspconfig")[server_name].setup({
				capabilities = capabilities,
				filetypes = filetypes,
				-- on_attach = function(client, bufnr)
				-- 	require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
				-- end,
			})
		end

		local servers = {
			pyright = { "python" },
			html = { "html" },
			cssls = { "css" },
			eslint = { "js" },
			lua_ls = { "lua" },
			gopls = { "go" },
			jsonls = { "jsonc", "json" },
			bashls = { "bash", "sh" },
			rust_analyzer = { "rust" },
			glsl_analyzer = { "glsl" },
		}
		for lsp, filetypes in pairs(servers) do
			setup_service(lsp, filetypes)
		end
	end,
}
