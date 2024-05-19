return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = false,
    config = function()
        local lsp_zero = require('lsp-zero')
        lsp_zero.extend_lspconfig()

        lsp_zero.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp_zero.default_keymaps({ buffer = bufnr })
        end)
        lsp_zero.format_on_save({
            format_opts = {
                async = true,
                timeout_ms = 10000,
            },
            servers = {
                ['tsserver'] = { 'javascript', 'typescript' },
                ['rust_analyzer'] = { 'rust' },
                ['lua_ls'] = { 'lia' },
            }
        })
    end
}
