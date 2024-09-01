local function clear_hl()
  vim.cmd("hi clear")
  vim.cmd("syntax reset")
end

---@param highlights table <string, table>
local function set_highlights(highlights)
  for name, setting in pairs(highlights) do
    vim.api.nvim_command(string.format(
      "highlight %s guifg=%s guibg=%s guisp=%s gui=%s",
      name,
      setting.fg or "none",
      setting.bg or "none",
      setting.sp or "none",
      setting.gui or "none"
    ))
  end
end

local hsl = require("user.hsl")

local red50 = hsl.hslToHex(360, 10, 50)
local red100 = hsl.hslToHex(360, 25, 55)
local red200 = hsl.hslToHex(360, 25, 60)
local red300 = hsl.hslToHex(360, 25, 65)
local red400 = hsl.hslToHex(360, 25, 70)

local deepRed100 = hsl.hslToHex(0, 30, 30)
local deepRed200 = hsl.hslToHex(0, 30, 35)
local deepRed300 = hsl.hslToHex(0, 30, 40)
local deepRed400 = hsl.hslToHex(0, 30, 45)

local pink50 = hsl.hslToHex(314, 15, 65)
local pink100 = hsl.hslToHex(314, 20, 65)
local pink200 = hsl.hslToHex(314, 25, 65)
local pink300 = hsl.hslToHex(314, 30, 65)
local pink400 = hsl.hslToHex(314, 35, 65)


local green100 = hsl.hslToHex(140, 10, 50)
local green200 = hsl.hslToHex(140, 15, 50)
local green300 = hsl.hslToHex(140, 20, 50)
local green400 = hsl.hslToHex(140, 25, 50)

local deepGreen100 = hsl.hslToHex(150, 10, 20)
local deepGreen200 = hsl.hslToHex(150, 15, 20)
local deepGreen300 = hsl.hslToHex(150, 20, 20)
local deepGreen400 = hsl.hslToHex(150, 25, 20)


local blue100 = hsl.hslToHex(210, 15, 50)
local blue200 = hsl.hslToHex(210, 25, 50)
local blue300 = hsl.hslToHex(210, 35, 50)
local blue400 = hsl.hslToHex(210, 45, 50)

local easyBlue100 = hsl.hslToHex(210, 45, 80)
local easyBlue200 = hsl.hslToHex(210, 50, 80)
local easyBlue300 = hsl.hslToHex(210, 55, 80)

local purple100 = hsl.hslToHex(284, 15, 50)
local purple200 = hsl.hslToHex(284, 20, 50)
local purple300 = hsl.hslToHex(284, 25, 50)
local purple400 = hsl.hslToHex(284, 30, 50)

local black100 = hsl.hslToHex(250, 5, 21)
local black200 = hsl.hslToHex(250, 5, 18)
local black300 = hsl.hslToHex(210, 5, 15)
local black400 = hsl.hslToHex(210, 5, 10)

local gray100 = hsl.hslToHex(210, 0, 30)
local gray200 = hsl.hslToHex(210, 0, 40)
local gray300 = hsl.hslToHex(210, 0, 50)
local gray400 = hsl.hslToHex(210, 0, 60)

local white100 = hsl.hslToHex(35, 10, 65)
local white200 = hsl.hslToHex(25, 10, 60)
local white300 = hsl.hslToHex(25, 10, 75)
local white400 = hsl.hslToHex(25, 10, 70)

local yellow100 = hsl.hslToHex(25, 20, 60)

local orange100 = hsl.hslToHex(25, 50, 60)


local Variable = white100
local String = green100
local Error = deepRed300
local Warning = orange100
local Hint = blue100
local Info = white100
local Ok = deepGreen100

local CursorLine = black200

local Added = green100
local Changed = orange100
local Deleted = red100



local bg = hsl.hslToHex(260, 10, 15)
local fg = red100

-- Some comment
local y = 10 == 20
local bol = true


local basic_highlights = {
  Normal = { bg = bg, fg=yellow100},
  EndOfBuffer = { bg = bg, fg = gray200 },
  Function = { fg = blue100, gui="bold"},
  Boolean = { fg = purple100 },             -- boolean constants
  Character = { fg = green100 },            -- character constants
  Comment = { fg = gray100 },               -- comments
  Constant = { fg = orange100, gui="bold"},              -- (preferred) any constant Delimiter = { fg = gray400 },          -- delimiter characters
  Float = { fg = purple100 },               -- float constants
  Error = { fg = fg },                      -- (preferred) any erroneous construct
  Exception = { fg = fg },                  -- 'try', 'catch', 'throw'
  Identifier = { fg = red100 },             -- (preferred) any variable
  Keyword = { fg = red100 },                -- any other keyword
  Conditional = { fg = fg },                -- conditionals
  Visual= {fg=white100, bg = gray100},
  Repeat = { fg = fg },                     -- loop keywords: 'for', 'while' etc
  Label = { fg = fg },                      -- 'case', 'default', etc
  Number = { fg = purple200 },              -- number constant
  Operator = { fg = gray300 },              -- '+', '*', 'sizeof' etc
  PreProc = { fg = fg },                    -- (preferred) generic preprocessor
  Define = { fg = fg},                     -- preprocessor '#define'
  Include = { fg = fg },                    -- preprocessor '#include'
  Macro = { fg = pink100 },                 -- macros
  PreCondit = { fg = fg },                  -- preprocessor conditionals '#if', '#endif' etc
  Special = { fg = yellow100 },                    -- (preferred) any special symbol
  SpecialChar = { fg = fg },                -- special character in a constant
  Delimiter = { fg = white100 },            -- special character in a constant
  SpecialComment = { fg = fg },             -- special things inside comments
  Tag = { fg = fg },                        -- can use <C-]> on this
  Statement = { fg = fg },                  -- (preferred) any statement
  String = { fg = String },                 -- string constants
  Title = { fg = white100 },
  Type = { fg = yellow100 },                  -- (preferred) 'int', 'long', 'char' etc
  StorageClass = { fg = blue100 },          -- 'static', 'volatile' etc
  Structure = { fg = blue100 },             -- 'struct', 'union', 'enum' etc
  Typedef = { fg = blue100 },               -- 'typedef'
  Todo = { fg = purple100, bg = green100}, -- (preferred) 'TODO' keywords in comments
  DiffAdd = {bg = deepGreen100},
  DiffDelete = { fg = white400, bg = deepRed100 },
  DiffText = { bg = hsl.hslToHex(160, 30, 25)},
  DiffChange = { bg = hsl.hslToHex(160, 30, 20)},
  DiagnosticError = { fg = Error },
  DiagnosticWarn = { fg = Warning },
  DiagnosticInfo = { fg = Info },
  DiagnosticHint = { fg = Hint },
  DiagnosticOk = { fg = Ok },
  Added = { fg = Added },
  Removed = { fg = Deleted },
  Changed = { fg = Changed },
  CurSearch = { fg = "black", bg = orange100 },
  CursorLine = { bg = CursorLine },
  Search = { fg = "black", bg = red100 },
  NvimInternalError = {bg =red100, fg = "black"},
  QuickFixLine = {fg = orange100 },
  Directory = {fg = red400},
  MoreMsg = {fg = blue200},
  WinBar = {fg = fg, bg=nil},
  NormalFloat = {fg = white100, bg=nil},
  DiagnosticUnderlineError = { fg = Error, gui="underline"},
  DiagnosticUnderlineWarn = { fg = Warning, gui="underline"},
  DiagnosticUnderlineInfo = { fg = Info, gui="underline"},
  DiagnosticUnderlineHint = { fg = Hint, gui="underline"},
  DiagnosticUnderlineOk = { fg = Ok, gui="underline"},
  PmenuSel = { fg = orange100 },
  Question = { fg = green100 },
  LineNr = { fg = gray100 },
  StatusLine = { fg = green100},
  StatusLineNC = { fg = green100 },

  ["@variable"] = { fg = Variable }
}
clear_hl()
set_highlights(basic_highlights)