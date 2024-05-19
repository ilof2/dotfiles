return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    {
      's1n7ax/nvim-window-picker',
      version = '2.*',
      config = function()
        require 'window-picker'.setup({
          filter_rules = {
            include_current_win = false,
            autoselect_one = true,
            -- filter using buffer options
            bo = {
              -- if the file type is one of following, the window will be ignored
              filetype = { 'neo-tree', "neo-tree-popup", "notify" },
              -- if the buffer type is one of following, the window will be ignored
              buftype = { 'terminal', "quickfix" },
            },
          },
        })
      end,
    },
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    local nvimtree = require("neo-tree")
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    nvimtree.setup({
      follow_current_file = true,
      view = {
        relativenumber = true,
      },
      git = {
        ignore = false,
      },
      buffers = {
        follow_current_file = {
          enabled = true,         -- This will find and focus the file in the active buffer every time
          --              -- the current file is changed while the tree is open.
          leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
      },
      -- filesystem = {
      --   follow_current_file = {
      --     enabled = true,           -- This will find and focus the file in the active buffer every time
      --     --               -- the current file is changed while the tree is open.
      --     leave_dirs_open = false,   -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
      --   },
      -- }
    })
  end,
}
