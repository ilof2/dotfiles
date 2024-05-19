return {
 'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  },
  config = function ()
    require('mason').setup({
        ensure_installed = {
            "debugpy"
        }
    })
    require('lsp-zero').extend_lspconfig()
    require('mason-lspconfig').setup({
      ensure_installed = {
          "pyright",
          "html",
          "cssls",
          "tsserver",
          "eslint",
          "lua_ls",
      },
      handlers = {
        function(server_name)
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local capabilities = cmp_nvim_lsp.default_capabilities()
          require('lspconfig')[server_name].setup({
          })
        end,
        -- lua_ls = function()
        --     local cmp_nvim_lsp = require("cmp_nvim_lsp")
        --     local capabilities = cmp_nvim_lsp.default_capabilities()
        --     require("lspconfig")["lua_ls"].setup({
        --         capabilities = capabilities,
        --         settings = {
        --           Lua = {
        --             diagnostics = {
        --                 globals = { "vim" },
        --             }
        --           }
        --         }
        --     })
        -- end

      },
    })

  end
}
