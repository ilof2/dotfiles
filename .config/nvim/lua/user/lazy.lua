local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  ui = {
    border = "single",
    size = {
      width = 0.8,
      height = 0.8,
    },
  },
  spec = {
    {import = "user.plugins"},
    {import = "user.plugins.lsp"}
  }
})
