return {
  {
    "ilof2/posterpole.nvim",
    priority=1000,
    -- branch = 'master',
    config = function ()
      local t1 = os.clock()
      require("posterpole").setup({
        transparent = false,
        brightness = 0,
        colorless_bg = false,
        dim_inactive = false,
        selected_tab_highlight = false,
        fg_saturation = 0,
        bg_saturation = 0
      })
      vim.cmd("colorscheme posterpole")
    end
  }
}
