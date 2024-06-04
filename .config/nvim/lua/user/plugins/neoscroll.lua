return {
  "karb94/neoscroll.nvim",
  enabled = false,
  lazy = true,
  config = function ()
    require('neoscroll').setup({
        cursor_scrolls_alone = false,
        performance_mode = true,
        respect_scrolloff = false,
    })
  end
}
