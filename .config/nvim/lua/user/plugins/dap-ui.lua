return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text"
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    dapui.setup({
      force_buffers = true,
      icons = { expanded = "", collapsed = "", current_frame = "." },
      mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
      },
      -- Use this to override mappings for specific elements
      element_mappings = {
        -- Example:
        -- stacks = {
        --   open = "<CR>",
        --   expand = "o",
        -- }
      },
      expand_lines = vim.fn.has("nvim-0.7") == 1,
      layouts = {
        {
          elements = {
            -- Elements can be strings or table with id and size keys.
            { id = "scopes", size = 0.25 },
            "breakpoints",
            "stacks",
            "watches",
          },
          size = 40,           -- 40 columns
          position = "left",
        },
        {
          elements = {
            -- "repl",
            "console",
            "watches",
          },
          width = 0.5,
          size = 0.25,           -- 25% of total lines
          position = "bottom",
        },
      },
      controls = {
        -- Requires Neovim nightly (or 0.8 when released)
        enabled = true,
        -- Display controls in this element
        element = "repl",
        icons = {
          pause = "",
          play = "",
          step_into = "",
          step_over = "",
          step_out = "",
          step_back = "",
          run_last = "",
          terminate = "",
        },
      },
      floating = {
        max_height = nil,          -- These can be integers or a float between 0 and 1.
        max_width = nil,           -- Floats will be treated as percentage of your screen.
        border = "single",         -- Border style. Can be "single", "double" or "rounded"
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
      windows = { indent = 1 },
      render = {
        max_type_length = nil,         -- Can be integer or nil.
        max_value_lines = 100,         -- Can be integer or nil.
      }
    })
    require("nvim-dap-virtual-text").setup({})
    vim.cmd("au FileType dap-repl lua require('dap.ext.autocompl').attach()")

    dap.listeners.before.attach.dapui_config = function()
      dapui.close({ layout = 2 })
      dapui.open({ layout = 2 })
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.close({ layout = 2 })
      dapui.open({ layout = 2 })
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close({ layout = 2 })
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close({ layout = 2 })
    end

    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_set_keymap
    -- movements --
    keymap("n", "<leader>e", "<Cmd>DapStepOver<CR>", opts)
    keymap("n", "<leader>s", "<Cmd>DapContinue<CR>", opts)
    keymap("n", "<leader>ew", "<Cmd>DapStepInto<CR>", opts)
    keymap("n", "<leader>eo", "<Cmd>DapStepOut<CR>", opts)
    -- run / stop / launch_json --
    keymap("n", "<leader>d", "<Cmd>DapToggleBreakpoint<CR>", opts)
    keymap("n", "<leader>dx", "<Cmd>DapTerminate<CR>", opts)
    keymap("n", "<leader>ds", "<Cmd>DapLoadLaunchJSON<CR>", opts)
    keymap("n", "<leader>dt", "<Cmd>lua require('dapui').close()<CR>", opts)
    -- toggle windows --
    keymap("n", "<leader>dv", "<Cmd>lua require('dapui').float_element('scopes', {enter=true})<CR>", opts)
    keymap("n", "<leader>dr", "<Cmd>lua require('dap').repl.open({}, 'vsplit') <CR>", opts)
    keymap("n", "<leader>dc", "<Cmd>lua require('dapui').float_element('console', {enter=true, width=100})<CR>", opts)
    keymap("n", "<leader>db", "<Cmd>lua require('dapui').float_element('breakpoints', {enter=true})<CR>", opts)
    keymap("n", "<leader>dt", "<Cmd>lua require('dapui').float_element('stacks', {enter=true})<CR>", opts)
    keymap("n", "<leader>dw", "<Cmd>lua require('dapui').float_element('watches', {enter=true})<CR>", opts)
  end
}
