return {
	"igorlfs/nvim-dap-view",
	lazy = false,
	version = "1.*",
	keys = {
		{ "<leader>e", "<Cmd>DapStepOver<CR>" },
		{ "<leader>s", "<Cmd>DapContinue<CR>" },
		{ "<leader>ew", "<Cmd>DapStepInto<CR>" },
		{ "<leader>eo", "<Cmd>DapStepOut<CR>" },
		-- run / stop / launch_json --
		{ "<leader>d", "<Cmd>DapToggleBreakpoint<CR>" },
		{ "<leader>dx", "<Cmd>DapTerminate<CR>" },
		{ "<leader>ds", "<Cmd>DapLoadLaunchJSON<CR>" },

		{ "<Leader>da", "<Cmd>lua require('dap').set_breakpoint(vim.fn.input('Condition: '), nil, nil)<CR>" },
		-- {"<leader>di", "<Cmd>DapVirtualTextToggle<CR>"},
		-- toggle windows --
		{ "<leader>dv", "<Cmd>DapViewShow scopes<CR>" },
		{ "<leader>dr", "<Cmd>DapViewJump repl<CR>" },
		{ "<leader>db", "<Cmd>DapViewShow breakpoints<CR>" },
		{ "<leader>dt", "<Cmd>DapViewJump threads<CR>" },
		{ "<leader>df", "<Cmd>DapViewToggle<CR>" },
		{ "<leader>dw", "<Cmd>DapViewShow watches<CR>" },
		--
		-- { "<leader>E", "<Cmd>lua require('dapui').eval(nil, {enter=true})<CR>" },
		-- { "<leader>S", "<Cmd>lua require('dapui').run_to_cursor()<CR>" },
	},
	opts = {
		switchbuf = "usetab,uselast",
		auto_toggle = true,
		winbar = {
			show = true,
			-- You can add a "console" section to merge the terminal with the other views
			sections = { "watches", "scopes", "exceptions", "breakpoints", "threads", "repl", "sessions" },
			-- Must be one of the sections declared above
			default_section = "watches",
			-- Append hints with keymaps within the labels
			show_keymap_hints = true,
			-- Configure each section individually
			base_sections = {
				-- Labels can be set dynamically with functions
				-- Each function receives the window's width and the current section as arguments
				breakpoints = { label = "Bp", keymap = "B" },
				scopes = { label = "Vars", keymap = "S" },
				exceptions = { label = "Exc", keymap = "E" },
				watches = { label = "Watch", keymap = "W" },
				threads = { label = "Thrs", keymap = "T" },
				repl = { label = "REPL", keymap = "R" },
				sessions = { label = "Ses", keymap = "K" },
				console = { label = "Console", keymap = "C" },
			},
			-- Add your own sections
			custom_sections = {},
			controls = {
				enabled = true,
				position = "right",
				buttons = {
					"play",
					"step_into",
					"step_over",
					"step_out",
					"step_back",
					"run_last",
					"terminate",
					"disconnect",
				},
				custom_buttons = {},
			},
		},
		windows = {
			-- `prev` is the last used position, might be nil
			position = "right",
			terminal = { position = "below", size = 0.3 },
		},
		icons = {
			collapsed = "󰅂 ",
			disabled = "",
			disconnect = "",
			enabled = "",
			expanded = "󰅀 ",
			filter = "󰈲",
			negate = " ",
			pause = "",
			play = "",
			run_last = "",
			step_back = "",
			step_into = "",
			step_out = "",
			step_over = "",
			terminate = "",
		},
	},
}
