return {
	"dyng/ctrlsf.vim",
	keys = {
		{ "<leader>rp", "<cmd>CtrlSF<cr>" },
		{ "<leader>r\\", "<cmd>CtrlSFToggle<cr>" },
		{ "<leader>rp", mode = { "v" }, "<Plug>CtrlSFVwordExec" },
	},
}
