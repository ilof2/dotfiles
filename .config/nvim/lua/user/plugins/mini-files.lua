return {
  keys = {

    { "<leader>f<tab>", '<cmd>lua require("mini.files").open(vim.api.nvim_buf_get_name(0), true)<CR>' },
    { "<leader><tab>",  '<cmd>lua require("mini.files").open(vim.loop.cwd(), true)<CR>' },
  },
  "echasnovski/mini.files",
  version = "*",
}
