-- rose-pine --
-- return {
--   "rose-pine/neovim",
--   name = "rose-pine",
--   dependencies = {
--     "ellisonleao/gruvbox.nvim",
--   },
--   config = function()
--     vim.opt.laststatus = 3 -- Or 3 for global statusline
--     require("rose-pine").setup({
--       variant = "moon",      -- auto, main, moon, or dawn
--       dark_variant = "moon", -- main, moon, or dawn
--       dim_inactive_windows = false,
--       extend_background_behind_borders = false,
--       enable = {
--         terminal = true,
--         legacy_highlights = false, -- Improve compatibility for previous versions of Neovim
--         migrations = true,         -- Handle deprecated options automatically
--       },
--       highlight_groups = {
--         TelescopeBorder = { fg = "highlight_high", bg = "none" },
--         TelescopeNormal = { bg = "none" },
--         -- TelescopePromptNormal = { bg = "base" },
--         TelescopeResultsNormal = { fg = "subtle", bg = "none" },
--         TelescopeSelection = { fg = "text", bg = "base" },
--         --TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
--         StatusLine = { fg = "love", bg = "love", blend = 10 },
--         Constant = { fg = "love", sp = "love"},
--         StatusLineNC = { fg = "subtle", bg = "surface" },
--         debugPC = { bg = "gold", blend = 25},
--         debugBreakpoint = {bg = "rose"},
--         DapBreakpointSymbol = {fg = "rose"}
--       },
--       styles = {
--         bold = true,
--         italic = true,
--         transparency = true,
--       },
--     })
--     vim.cmd("colorscheme rose-pine-moon")
--   end
-- }
-- gruvbox --
-- return {
--   "ellisonleao/gruvbox.nvim",
--   priority = 1000,
--   lazy = false,
--   config = function()
--     require("gruvbox").setup({
--       terminal_colors = true, -- add neovim terminal colors
--       undercurl = true,
--       underline = true,
--       bold = true,
--       italic = {
--         strings = true,
--         emphasis = true,
--         comments = true,
--         operators = false,
--         folds = true,
--       },
--       strikethrough = true,
--       invert_selection = false,
--       invert_signs = false,
--       invert_tabline = false,
--       invert_intend_guides = false,
--       inverse = true, -- invert background for search, diffs, statuslines and errors
--       contrast = "soft", -- can be "hard", "soft" or empty string
--       palette_overrides = {},
--       overrides = {},
--       dim_inactive = false,
--       transparent_mode = true,
--     })
--     vim.cmd("colorscheme gruvbox")
--   end,
--
-- }

return {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  -- Optional; default configuration will be used if setup isn't called.
  config = function()
    require("everforest").setup({
      transparent_background_level = 1,
      on_highlights = function(hl, palette)
          hl.Constant = { fg = palette.orange, bg = palette.none, sp = palette.red }
      end,
    })
    vim.cmd("colorscheme everforest")
  end,
}
-- TODO Create my own colorscheme
