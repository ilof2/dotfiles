return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"mfussenegger/nvim-dap-python",
		--     "ravenxrz/DAPInstall.nvim"
	},
	commit = "665d3569a86395fe0dab85efbdb26d7d2ee57e49",
	config = function()
		vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "Error", linehl = "", numhl = "" })
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{ text = "", texthl = "WarningMsg", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)
		--local dap_install = require("dap-install")

		--dap_install.setup({
		--    installation_path = vim.fn.stdpath("data") .. "/dapinstall/"
		--})
		-- require('dap.ext.vscode').load_launchjs(nil, {})
		-- dap.adapters.python = {
		--   type = 'executable';
		--   command = 'python';
		--   args = { '-m', 'debugpy.adapter' };
		-- }
		--dap_install.config("python", {})
	end,
}
