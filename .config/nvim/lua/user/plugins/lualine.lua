return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
        local lualine = require("lualine")
        local filetype = function (props)
            local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
            if filename == "" then
              filename = "[No Name]"
            end
            local devicons = require("nvim-web-devicons")
            local ft_icon, ft_color = devicons.get_icon_color(filename)
            return {
                "filetype",
                fg=ft_color
            }
        end

        lualine.setup {
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '|', right = '|' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = true,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = { 'mode', },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { '%=', 'filename', 'harpoon2' },
                lualine_x = { 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    end

}
-- return {
--     'b0o/incline.nvim',
--     event = 'VeryLazy',
--     config = function()
--         require("incline").setup({
--             window = {
--                 placement = {
--                     vertical = "bottom",
--                     horizontal = "center",
--                 },
--                 padding = 0,
--                 margin = { vertical = 0, horizontal = 0 },
--             },
--             hide = {
--                 cursorline = false,
--             },
--             render = function(props)
--                 local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
--                 if filename == "" then
--                     filename = "[No Name]"
--                 end
--                 local devicons = require("nvim-web-devicons")
--                 local ft_icon, ft_color = devicons.get_icon_color(filename)
--
--                 local function get_git_diff()
--                     local icons = { removed = " ", changed = " ", added = " " }
--                     local signs = vim.b[props.buf].gitsigns_status_dict
--                     local labels = {}
--                     if signs == nil then
--                         return labels
--                     end
--                     for name, icon in pairs(icons) do
--                         if tonumber(signs[name]) and signs[name] > 0 then
--                             table.insert(labels, { icon .. signs[name] .. " ", group = "Diff" .. name })
--                         end
--                     end
--                     if #labels > 0 then
--                         table.insert(labels, { "| " })
--                     end
--                     return labels
--                 end
--
--                 local function get_diagnostic_label()
--                     local icons = { error = " ", warn = " ", info = " ", hint = " " }
--                     local label = {}
--
--                     for severity, icon in pairs(icons) do
--                         local n = #vim.diagnostic.get(
--                             props.buf,
--                             { severity = vim.diagnostic.severity[string.upper(severity)] }
--                         )
--                         if n > 0 then
--                             table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
--                         end
--                     end
--                     if #label > 0 then
--                         table.insert(label, { "| " })
--                     end
--                     return label
--                 end
--
--                 local function get_harpoon_items()
--                     local harpoon = require("harpoon")
--                     local marks = harpoon:list().items
--                     local current_file_path = vim.fn.expand("%:p:.")
--                     local label = {}
--
--                     for id, item in ipairs(marks) do
--                         if item.value == current_file_path then
--                             table.insert(label, { id .. " ", guifg = "#FFFFFF", gui = "bold" })
--                         else
--                             table.insert(label, { id .. " ", guifg = "#434852" })
--                         end
--                     end
--
--                     if #label > 0 then
--                         table.insert(label, 1, { "󰛢 ", guifg = "#61AfEf" })
--                         table.insert(label, { "| " })
--                     end
--                     return label
--                 end
--
--                 local function get_file_name()
--                     local label = {}
--                     table.insert(label, { (ft_icon or "") .. " ", guifg = ft_color, guibg = "none" })
--                     table.insert(label, { vim.bo[props.buf].modified and " " or "", guifg = "#d19a66" })
--                     table.insert(
--                         label,
--                         { filename, gui = vim.bo[props.buf].modified and "bold,italic" or "bold" }
--                     )
--                     if not props.focused then
--                         label["group"] = "BufferInactive"
--                     end
--
--                     return label
--                 end
--
--                 return {
--                     { "", guifg = "#0e0e0e" },
--                     {
--                         { get_diagnostic_label() },
--                         -- { get_git_diff() },
--                         { get_harpoon_items() },
--                         { get_file_name() },
--                         guibg = "#0e0e0e",
--                     },
--                     { "", guifg = "#0e0e0e" },
--                 }
--             end,
--         })
--     end
-- }
