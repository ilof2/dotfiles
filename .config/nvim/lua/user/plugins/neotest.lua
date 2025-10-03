return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
  },
  config = function ()
    require("neotest").setup({
      adapters = {
        require("neotest-python")({
          dap = { justMyCode = false },
        })
      },
      discovery = {
        -- Drastically improve performance in ginormous projects by
        -- only AST-parsing the currently opened buffer.
        enabled = false,
        -- Number of workers to parse files concurrently.
        -- A value of 0 automatically assigns number based on CPU.
        -- Set to 1 if experiencing lag.
        concurrent = 1,
      },
    })
  end,

  keys = {
    -- Run file tests --
    {"<leader>R", "<Cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>"},

    -- Run nearest test --
    {"<leader>rt", "<Cmd>lua require('neotest').run.run()<CR>"},

    -- Run tests debuger --
    {"<leader>rtb", "<Cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>"},
    {"<leader>to", "<Cmd>Neotest output<CR>"},
  }
}
