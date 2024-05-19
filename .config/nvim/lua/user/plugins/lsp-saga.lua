return {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({
            lightbulb = {
                enable = false,
            },
            border_style = "single",
            error_sign = "e",
            warn_sign = ""
        })
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    }
}
