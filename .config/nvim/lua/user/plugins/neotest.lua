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
        require("neotest-python")
      }
    })
  end,

  keys = {
    -- Run file tests --
    {"<leader>R", "<Cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>"},

    -- Run nearest test --
    {"<leader>rt", "<Cmd>lua require('neotest').run.run()<CR>"},

    -- Run tests debuger --
    {"<leader>rtb", "<Cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>"},
  }
}
