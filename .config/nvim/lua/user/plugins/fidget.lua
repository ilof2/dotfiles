-- return {
--     "folke/noice.nvim",
--     event = "VeryLazy",
--     opts = {
--         messages = {
--             view = "mini",
--             view_error = "mini", -- view for errors
--             view_warn = "mini", -- view for warnings
--             view_history = "messages",
--         },
--         notify = {
--             enabled = false
--         },
--         presets = {
--             lsp_doc_border = true
--         },
--     },
--     dependencies = {
--         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
--         "MunifTanjim/nui.nvim",
--         -- OPTIONAL:
--         --   `nvim-notify` is only needed, if you want to use the notification view.
--         --   If not available, we use `mini` as the fallback
--         "rcarriga/nvim-notify",
--     }
-- }

return {
    "j-hui/fidget.nvim",
    opts = {
        notification = {
            override_vim_notify = true,
            window = {
                normal_hl = "Comment", -- Base highlight group in the notification window
                winblend = 0,    -- Background color opacity in the notification window
                border = "single",   -- Border around the notification window
                zindex = 45,       -- Stacking priority of the notification window
                max_width = 0,     -- Maximum width of the notification window
                max_height = 0,    -- Maximum height of the notification window
                x_padding = 1,     -- Padding from right edge of window boundary
                y_padding = 0,     -- Padding from bottom edge of window boundary
                align = "top",     -- How to align the notification window
                relative = "editor", -- What the notification window position is relative to
            },

        },
    },
}
