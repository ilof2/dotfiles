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

-- return {
--   "neanias/everforest-nvim",
--   version = false,
--   lazy = false,
--   priority = 1000, -- make sure to load this before all the other start plugins
--   -- Optional; default configuration will be used if setup isn't called.
--   config = function()
--     require("everforest").setup({
--       transparent_background_level = 2,
--       on_highlights = function(hl, palette)
--           hl.Constant = { fg = palette.orange, bg = palette.none, sp = palette.red }
--       end,
--     })
--     vim.cmd("colorscheme everforest")
--   end,
-- }
-- TODO Create my own colorscheme
--

return {
  {
    "vague2k/vague.nvim",
    config = function()
      require("vague").setup({
        transparent = false,

        -- optional configuration here
        style = {
          builtin_constants = "bold",
          functions = "bold",
        },
      })
      -- vim.cmd("colorscheme habamax")
    end
  },
  {
    "sho-87/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa-paper").setup({
        transparent = false,
        functionStyle = { italic = false, bold = true },
      })
    end
  },
  {
    "sainttttt/flesh-and-blood",
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("gruvbox").setup({
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "soft", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      })
      -- vim.cmd("colorscheme gruvbox")
    end,
  },
  {
    "sainnhe/gruvbox-material"
  }
}
