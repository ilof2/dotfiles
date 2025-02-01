-- return {
-- 	"saghen/blink.cmp",
-- 	lazy = false, -- lazy loading handled internally
-- 	-- optional: provides snippets for the snippet source
-- 	dependencies = "rafamadriz/friendly-snippets",
--
-- 	-- use a release tag to download pre-built binaries
-- 	version = "v0.5.1",
-- 	-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
-- 	-- build = 'cargo build --release',
-- 	-- If you use nix, you can build from source using latest nightly rust with:
-- 	-- build = 'nix run .#build-plugin',
-- 	--
-- 	---@module 'blink.cmp'
-- 	---@type blink.cmp.Config
-- 	opts = {
-- 		-- 'default' for mappings similar to built-in completion
-- 		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
-- 		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
-- 		-- see the "default configuration" section below for full documentation on how to define
-- 		-- your own keymap.
-- 		keymap = {
-- 			preset = "default",
-- 			["<A-space>"] = { "show", "show_documentation", "hide_documentation" },
-- 			["<C-j>"] = { "select_next", "fallback" },
-- 			["<C-k>"] = { "select_prev", "fallback" },
-- 			["<enter>"] = { "select_and_accept", "fallback" },
-- 		},
-- 		signature_help = {
-- 			enabled = false,
-- 			blocked_trigger_characters = {},
-- 			blocked_retrigger_characters = {},
-- 			-- when true, will show the signature help window when the cursor comes after a trigger character when entering insert mode
-- 			show_on_insert_on_trigger_character = true,
-- 		},
-- 		windows = {
-- 			autocomplete = {
-- 				border = "single",
-- 			},
-- 		},
-- 		highlight = {
-- 		  -- sets the fallback highlight groups to nvim-cmp's highlight groups
-- 		  -- useful for when your theme doesn't support blink.cmp
-- 		  -- will be removed in a future release, assuming themes add support
-- 		  use_nvim_cmp_as_default = false,
--
-- 		},
-- 		-- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
-- 		-- adjusts spacing to ensure icons are aligned
-- 		nerd_font_variant = "mono",
--
-- 		-- experimental auto-brackets support
-- 		-- accept = { auto_brackets = { enabled = true } }
--
-- 		-- experimental signature help support
-- 		-- trigger = { signature_help = { enabled = true } }
-- 	},
-- 	-- allows extending the enabled_providers array elsewhere in your config
-- 	-- without having to redefining it
-- 	opts_extend = { "sources.completion.enabled_providers" },
-- }

-- LSP servers and clients communicate what features they support through "capabilities".
--  By default, Neovim support a subset of the LSP specification.
--  With blink.cmp, Neovim has *more* capabilities which are communicated to the LSP servers.
--  Explanation from TJ: https://youtu.be/m8C0Cq9Uv9o?t=1275
--
-- This can vary by config, but in-general for nvim-lspconfig:

return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp"
    },
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "onsails/lspkind.nvim"
  },
  config = function()
    local kind_icons = {
      Text = "",
      Method = "󰅲",
      Function = "󰊕",
      Constructor = "",
      Field = "",
      Variable = "󱈎",
      Class = "",
      Interface = "",
      Module = "",
      Property = "󰌆",
      Unit = "",
      Value = "󱀍",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "󰽽",
      Struct = "",
      Event = "",
      Operator = "",
      TypeParameter = "",
    }
    local check_backspace = function()
      local col = vim.fn.col "." - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
    end
    local cmp = require("cmp")

    local luasnip = require("luasnip")

    local lspkind = require("lspkind")

    vim.cmd(':set winhighlight=' .. cmp.config.window.bordered().winhighlight) -- window borders

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup {
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<A-Space>"] = cmp.mapping(cmp.mapping.complete()),
        -- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-e>"] = cmp.mapping {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        },
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<cr>"] = cmp.mapping.confirm { select = true },
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif check_backspace() then
            fallback()
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          -- Kind icons
          vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
          -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]",
          })[entry.source.name]
          return vim_item
        end,
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "dap" }
      }),
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      experimental = {
        ghost_text = true,
        native_menu = false,
      },
    }
  end
}
