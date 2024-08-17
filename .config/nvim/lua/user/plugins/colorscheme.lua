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
-- return {
--   -- https://github.com/rebelot/kanagawa.nvim
--   'rebelot/kanagawa.nvim', -- You can replace this with your favorite colorscheme
--   lazy = false,            -- We want the colorscheme to load immediately when starting Neovim
--   priority = 1000,         -- Load the colorscheme before other non-lazy-loaded plugins
--   opts = {
--     -- Replace this with your scheme-specific settings or remove to use the defaults
--     transparent = false,
--     background = {
--       -- light = "lotus",
--       dark = "dragon", -- "wave, dragon"
--     },
--     -- overrides = function(colors)
--     --   local theme = colors.theme
--     --   return {
--     --     NormalFloat = { bg = "none" },
--     --     FloatBorder = { bg = "none" },
--     --     FloatTitle = { bg = "none" },
--     --
--     --     -- Save an hlgroup with dark background and dimmed foreground
--     --     -- so that you can use it where your still want darker windows.
--     --     -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
--     --     NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
--     --
--     --     -- Popular plugins that open floats will link to NormalFloat by default;
--     --     -- set their background accordingly if you wish to keep them dark and borderless
--     --     LazyNormal = { bg = "none", fg = theme.ui.fg_dim },
--     --     MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
--     --     TelescopeTitle = { fg = theme.ui.special, bold = true },
--     --     TelescopePromptNormal = { bg = "none" },
--     --     TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = "none" },
--     --     TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = "none" },
--     --     TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = "none" },
--     --     TelescopePreviewNormal = { bg = "none" },
--     --     TelescopePreviewBorder = { bg = "none", fg = theme.ui.bg_dim },
--     --     Pmenu = { fg = theme.ui.shade0, bg = "none"},     -- add `blend = vim.o.pumblend` to enable transparency
--     --     PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
--     --     PmenuSbar = { bg = theme.ui.bg_m1 },
--     --     PmenuThumb = { bg = theme.ui.bg_p2 },
--     --     WinSeparator = { fg = "gray" },
--     --   }
--     -- end,
--     colors = {
--       palette = {
--         -- Background colors
--         sumiInk0 = "#161616", -- modified
--         sumiInk1 = "#181818", -- modified
--         sumiInk2 = "#1a1a1a", -- modified
--         sumiInk3 = "#1F1F1F", -- modified
--         sumiInk4 = "#2A2A2A", -- modified
--         sumiInk5 = "#363636", -- modified
--         sumiInk6 = "#545454", -- modified
--
--         -- Popup and Floats
--         waveBlue1 = "#322C47", -- modified
--         waveBlue2 = "#4c4464", -- modified
--
--         -- Diff and Git
--         winterGreen = "#2B3328",
--         winterYellow = "#49443C",
--         winterRed = "#43242B",
--         winterBlue = "#252535",
--         autumnGreen = "#76A56A", -- modified
--         autumnRed = "#C34043",
--         autumnYellow = "#DCA561",
--
--         -- Diag
--         samuraiRed = "#E82424",
--         roninYellow = "#FF9E3B",
--         waveAqua1 = "#7E9CD8",  -- modified
--         dragonBlue = "#7FB4CA", -- modified
--
--         -- Foreground and Comments
--         oldWhite = "#C8C093",
--         fujiWhite = "#F9E7C0",   -- modified
--         fujiGray = "#727169",
--         oniViolet = "#BFA3E6",   -- modified
--         oniViolet2 = "#BCACDB",  -- modified
--         crystalBlue = "#8CABFF", -- modified
--         springViolet1 = "#938AA9",
--         springViolet2 = "#9CABCA",
--         springBlue = "#7FC4EF", -- modified
--         waveAqua2 = "#77BBDD",  -- modified
--
--         springGreen = "#98BB6C",
--         boatYellow1 = "#938056",
--         boatYellow2 = "#C0A36E",
--         carpYellow = "#FFEE99", -- modified
--
--         sakuraPink = "#D27E99",
--         waveRed = "#E46876",
--         peachRed = "#FF5D62",
--         surimiOrange = "#FFAA44", -- modified
--         katanaGray = "#717C7C",
--       },
--     },
--   },
--   config = function(_, opts)
--     require('kanagawa').setup(opts) -- Replace this with your favorite colorscheme
--     vim.cmd("colorscheme kanagawa") -- Replace this with your favorite colorscheme
--
--     -- Custom diff colors
--     vim.cmd([[
--       autocmd VimEnter * hi DiffAdd guifg=#00FF00 guibg=#005500
--       autocmd VimEnter * hi DiffDelete guifg=#FF0000 guibg=#550000
--       autocmd VimEnter * hi DiffChange guifg=#CCCCCC guibg=#555555
--       autocmd VimEnter * hi DiffText guifg=#00FF00 guibg=#005500
--     ]])
--
--     vim.cmd("highlight GitSignsAdd ctermbg=none guibg=none")
--     vim.cmd("highlight GitSignsDelete ctermbg=none guibg=none")
--     vim.cmd("highlight GitSignsChange ctermbg=none guibg=none")
--
--     -- Custom border colors
--     vim.cmd([[
--       autocmd ColorScheme * hi NormalFloat guifg=#F9E7C0 guibg=#1F1F1F
--       autocmd ColorScheme * hi FloatBorder guifg=#F9E7C0 guibg=#1F1F1F
--     ]])
--   end
-- }
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
          functions = "bold"
        }
      })
      -- vim.cmd("colorscheme vague")
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
      vim.cmd("colorscheme kanagawa-paper")
    end
  }
}
