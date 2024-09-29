return {
  {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {},
      dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
      -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
      -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
      ft = { "markdown" },
      config = function ()
        require("render-markdown").setup({
          backgrounds = {
              'RenderMarkdownH1Bg',
              'RenderMarkdownH2Bg',
              'RenderMarkdownH3Bg',
              'RenderMarkdownH4Bg',
              'RenderMarkdownH5Bg',
              'RenderMarkdownH6Bg',
          },
        })
      end
  },
  {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  enabled = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  "BufReadPre ~/obsidian_vaults/Life/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/obsidian_vaults/Life/",
      },
    },

    -- see below for full list of options 👇
  },
}}
