return {
	"neovim/nvim-lspconfig",
	-- event = { "BufReadPre", "BufNewFile" },
	lazy = false,
	enabled = true,
	dependencies = {
		"saghen/blink.cmp",
	},
	config = function(_, lsp_opts)
		local setup_service = function(server_name, filetypes)
			local original_capabilities = vim.lsp.protocol.make_client_capabilities()
			local capabilities = require("blink.cmp").get_lsp_capabilities(original_capabilities)
			if server_name == "rust_analyzer" then
				vim.lsp.config(server_name, {
					settings = {
						["rust-analyzer"] = {
							cargo = { allFeatures = true },
						},
					},
					capabilities = capabilities,
					filetypes = filetypes,
				})
				return
			end
			vim.lsp.config(server_name, {
				capabilities = capabilities,
				filetypes = filetypes,
			})
		end

		local servers = {
			pyright = { "python" },
			ruff = { "python" },
			ty = { "python" },
			htmllsp = { "html" },
			cssls = { "css" },
			eslint = { "js" },
			lua_ls = { "lua" },
			gopls = { "go" },
			jsonls = { "jsonc", "json" },
			bashls = { "bash", "sh" },
			rust_analyzer = { "rust" },
			glsl_analyzer = { "glsl" },
			hyprls = { "hyprlang" },
		}
		for lsp, filetypes in pairs(servers) do
			setup_service(lsp, filetypes)
		end
	end,
}
