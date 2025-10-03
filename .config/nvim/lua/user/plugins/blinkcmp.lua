return {
	"saghen/blink.cmp",
	lazy = false, -- lazy loading handled internally
	enabled = true,
	-- optional: provides snippets for the snippet source
	dependencies = "rafamadriz/friendly-snippets",

	-- use a release tag to download pre-built binaries
	version = "1.*",
	-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',
	--
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- see the "default configuration" section below for full documentation on how to define
		-- your own keymap.
		keymap = {
			preset = "default",
			["<A-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-j>"] = { "select_next", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<enter>"] = { "select_and_accept", "fallback" },
			["<tab>"] = { "select_and_accept", "fallback" },
			["<C-e>"] = { "show", "hide"},
			["<C-s>"] = { "hide_signature", "show_signature"},
		},
		-- signature_help = {
		-- 	enabled = true,
		-- 	blocked_trigger_characters = {},
		-- 	blocked_retrigger_characters = {},
		-- 	-- when true, will show the signature help window when the cursor comes after a trigger character when entering insert mode
		-- 	show_on_insert_on_trigger_character = true,
		-- },
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		-- windows = {
		-- 	autocomplete = {
		-- 		border = "single",
		-- 	},
		-- },
		-- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- adjusts spacing to ensure icons are aligned
		appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},
    signature = {enabled = true},

		-- experimental auto-brackets support
		-- accept = { auto_brackets = { enabled = true } }

		-- experimental signature help support
		completion = { documentation = { auto_show = true } },
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	-- allows extending the enabled_providers array elsewhere in your config
	-- without having to redefining it
	opts_extend = { "sources.completion.enabled_providers", "sources.defuault"},

}
