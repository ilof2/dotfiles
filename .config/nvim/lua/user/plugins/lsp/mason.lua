return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    -- "microsoft/python-type-stubs",
  },
  enabled = true,
  config = function()
    require('mason').setup({
      ensure_installed = {
        "debugpy",
        "pyright"
      },
      ui = {
        border = "single"
      },
    })
    -- require('mason-lspconfig').setup({
    --   ensure_installed = {
    --     "pyright",
    --     -- "jedi_language_server",
    --     "html",
    --     "cssls",
    --     -- "ts_ls", -- Add later
    --     "eslint",
    --     "lua_ls",
    --   },
    --   handlers = {
    --     function(server_name)
    --       -- local cmp_nvim_lsp = require("cmp_nvim_lsp")
    --       local original_capabilities = vim.lsp.protocol.make_client_capabilities()
    --       -- local capabilities = cmp_nvim_lsp.default_capabilities(original_capabilities)
    --       local capabilities = require('blink.cmp').get_lsp_capabilities(original_capabilities)
    --
    --       local border = {
    --         { '┌', 'FloatBorder' },
    --         { '─', 'FloatBorder' },
    --         { '┐', 'FloatBorder' },
    --         { '│', 'FloatBorder' },
    --         { '┘', 'FloatBorder' },
    --         { '─', 'FloatBorder' },
    --         { '└', 'FloatBorder' },
    --         { '│', 'FloatBorder' },
    --       }
    --       -- change hover and help handlers on the same but with bordered window
    --       local handlers = {
    --         ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
    --         ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    --       }
    --       -- if server_name == "jedi_language_server" then
    --       --   handlers = {
    --       --     -- HACK: disabe hover and signature help from jedi
    --       --     ['textDocument/signatureHelp'] = vim.lsp.with(function (_, _) return end, {}),
    --       --     ['textDocument/hover'] = vim.lsp.with(function (_, _) return end, {})
    --       --   }
    --       -- end
    --       require('lspconfig')[server_name].setup({
    --         capabilities=capabilities,
    --         handlers=handlers
    --       })
    --
    --     end,
    --     -- lua_ls = function()
    --     --     local cmp_nvim_lsp = require("cmp_nvim_lsp")
    --     --     local capabilities = cmp_nvim_lsp.default_capabilities()
    --     --     require("lspconfig")["lua_ls"].setup({
    --     --         capabilities = capabilities,
    --     --         settings = {
    --     --           Lua = {
    --     --             diagnostics = {
    --     --                 globals = { "vim" },
    --     --             }
    --     --           }
    --     --         }
    --     --     })
    --     -- end
    --
    --   },
    -- })
  end
}
