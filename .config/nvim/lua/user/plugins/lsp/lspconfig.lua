return {
	"neovim/nvim-lspconfig",
	-- event = { "BufReadPre", "BufNewFile" },
	lazy = false,
	enabled = true,
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
		-- 'saghen/blink.cmp',
	},
	config = function(_, lsp_opts)
		local win = require("lspconfig.ui.windows")
		win.default_options.border = "single"
		local border = {
			{ "┌", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "┐", "FloatBorder" },
			{ "│", "FloatBorder" },
			{ "┘", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "└", "FloatBorder" },
			{ "│", "FloatBorder" },
		}
		-- for type, icon in pairs(signs) do
		--   local hl = "DiagnosticSign" .. type
		--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		-- end
		local setup_service = function(server_name, filetypes)
			local original_capabilities = vim.lsp.protocol.make_client_capabilities()
			-- local capabilities = require('blink.cmp').get_lsp_capabilities(original_capabilities)
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = cmp_nvim_lsp.default_capabilities(original_capabilities)

			-- change hover and help handlers on the same but with bordered window
			local handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
			}
			require("lspconfig")[server_name].setup({
				capabilities = capabilities,
				handlers = handlers,
				filetypes = filetypes,
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
		}
		for lsp, filetypes in pairs(servers) do
			setup_service(lsp, filetypes)
		end
	end,
}
