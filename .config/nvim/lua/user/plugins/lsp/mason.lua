return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  },
  enabled = false,
  config = function()
    require('mason').setup({
      ensure_installed = {
        "debugpy",
        "pyright"
      }
    })
    require('mason-lspconfig').setup({
      ensure_installed = {
        "pyright",
        "html",
        "cssls",
        -- "ts_ls", -- Add later
        "eslint",
        "lua_ls",
      },
      handlers = {
        function(server_name)
          local cmp_nvim_lsp = require("cmp_nvim_lsp")
          local capabilities = cmp_nvim_lsp.default_capabilities()

          local border = {
            { '┌', 'FloatBorder' },
            { '─', 'FloatBorder' },
            { '┐', 'FloatBorder' },
            { '│', 'FloatBorder' },
            { '┘', 'FloatBorder' },
            { '─', 'FloatBorder' },
            { '└', 'FloatBorder' },
            { '│', 'FloatBorder' },
          }
          -- change hover and help handlers on the same but with bordered window
          local handlers = {
            ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
            ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
          }
          require('lspconfig')[server_name].setup({
            capabilities=capabilities,
            handlers=handlers
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
