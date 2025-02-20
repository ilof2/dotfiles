return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  enabled = true,
  commit = "3e61767ccf56aa75adc2cb5390334cdb40b4ce05",
  keys = {
    -- movements --
    {"<leader>e", "<Cmd>DapStepOver<CR>"},
    {"<leader>s", "<Cmd>DapContinue<CR>"},
    {"<leader>ew", "<Cmd>DapStepInto<CR>"},
    {"<leader>eo", "<Cmd>DapStepOut<CR>"},
    -- run / stop / launch_json --
    {"<leader>d", "<Cmd>DapToggleBreakpoint<CR>"},
    {"<leader>dx", "<Cmd>DapTerminate<CR>"},
    {"<leader>ds", "<Cmd>DapLoadLaunchJSON<CR>"},
    {"<leader>dt", "<Cmd>lua require('dapui').close()<CR>"},
    -- {"<leader>di", "<Cmd>DapVirtualTextToggle<CR>"},
    -- toggle windows --
    {"<leader>dv", "<Cmd>lua require('dapui').float_element('scopes', {enter=true})<CR>"},
    {"<leader>dr", "<Cmd>DapToggleRepl<CR>"},
    {"<leader>dc", "<Cmd>lua require('dapui').float_element('console', {enter=true, width=100})<CR>"},
    {"<leader>db", "<Cmd>lua require('dapui').float_element('breakpoints', {enter=true})<CR>"},
    {"<leader>dt", "<Cmd>lua require('dapui').float_element('stacks', {enter=true})<CR>"},
    {"<leader>dw", "<Cmd>lua require('dapui').float_element('watches', {enter=true})<CR>"},
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
      -- expand_lines = vim.fn.has("nvim-0.7") == 1,
      layouts = {
        {
          elements = {
            -- Elements can be strings or table with id and size keys.
            { id = "scopes", size = 0.25 },
            "breakpoints",
            -- "stacks",
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
            -- "stacks",
          },
          width = 0.5,
          size = 0.25,           -- 25% of total lines
          position = "bottom",
        },
      },
      controls = {
        -- Requires Neovim nightly (or 0.8 when released)
        enabled = false,
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
      auto_refresh = false,
      expand_lines = false,
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
  end
}
