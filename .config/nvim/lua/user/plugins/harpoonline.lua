return {
  "abeldekat/harpoonline",
  version = "*",
  config = function()
    local Harpoonline = require("harpoonline")
    function BRANCH_NAME()
      local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
      if branch ~= "" then
        return branch
      else
        return ""
      end
    end

    local function harpoon_status()
      return Harpoonline.format()
    end

    local function statusline()
      -- statusline="%#GruvboxOrangeBold#[" .. BRANCH_NAME() .. "]%*%#GruvboxGreenBold# %= %f %#TSRainbowRed#%m %*%#GruvboxGreenBold# %= %l:%c (%L) %#GruvboxRed#♥ ",
      local branch_name = BRANCH_NAME()
      local branch_color = "%#GruvboxOrangeBold#[" .. branch_name .. "]%*"
      local is_modified = "%m"
      local is_modified_color = "%#TSRainbowRed#" .. is_modified .. "%*"
      local fileinfo = "%f " .. is_modified_color
      local curs_position = " %l:%c (%L) %#GruvboxRed#♥ %*"
      return table.concat({
        branch_color, "%#GruvboxGreenBold#  ", "%=", fileinfo, "%#GruvboxGreenBold# ", harpoon_status(), "%=", curs_position
      })
    end
    vim.opt.statusline = statusline()

    vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "FocusGained", "BufRead", "DirChanged" }, {
      callback = function()
        vim.b.branch_name = BRANCH_NAME()
        vim.opt.statusline = statusline()
      end
    })

    Harpoonline.setup({
      formatter_opts = {
        default = { -- remove all spaces...
          inactive = "%s ",
          active = "[%s] ",
        },
      },
      on_update = function() vim.opt.statusline = statusline() end,
    })


    local harpooninfo = { Harpoonline.format, "filename" }
  end,
}
