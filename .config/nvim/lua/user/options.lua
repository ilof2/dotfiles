local options = {
  -- Leader remaps
  bg="dark",
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  encoding = "utf8",
  hlsearch = true,                         -- highlight all matches on previous search pattern
  incsearch = true,
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = true,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 300,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  undolevels=100,
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  tabstop = 4,                             -- insert 2 spaces for a tab
  guicursor = "",
  autoindent = true,
  cursorline = false,     -- highlight the current line
  number = true,          -- set numbered lines
  relativenumber = true,  -- set relative numbered lines
  numberwidth = 2,        -- set number column width to 2 {default 4}
  foldcolumn="1",

  signcolumn = "yes",     -- always show the sign column, otherwise it would shift the text each time
  wrap = false,           -- display lines as one long line
  linebreak = true,       -- companion to wrap, don't split words
  scrolloff = 3,         -- minimal number of screen lines to keep above and below the cursor
  sidescrolloff = 8,      -- minimal number of screen columns either side of cursor if wrap is `false`
  whichwrap = "bs<>[]hl", -- which "horizontal" keys are allowed to travel to prev/next line
  backspace = "indent,eol,start",
  laststatus = 3,
  spelllang = "en_US",
  tabline = "%#Added#%f",
  wildmenu = true,
  hidden = true,
}


for k, v in pairs(options) do
  vim.opt[k] = v
end
-- netrw settings --
vim.g.netrw_browse_split=4
vim.g.netrw_banner=0
vim.g.netrw_altv=1
vim.g.netrw_liststyle=3

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.js", "*.html", "*.css", "*.lua" },
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
  end
})

-- vim.opt.shortmess = "ilmnrx"                        -- flags to shorten vim messages, see :help 'shortmess'
vim.opt.shortmess:append "c"                          -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append "-"                          -- hyphenated words recognized by searches
vim.opt.formatoptions:remove({ "c", "r", "o" })       -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles") -- separate vim plugins from neovim in case vim still in use

local function set_highlights()
  vim.cmd("highlight WinSeparator ctermbg=none guifg=gray")
end

local function set_transparency()
  -- vim.cmd("highlight TabLineFill ctermbg=none guibg=none")
  -- vim.cmd("highlight StatusLine ctermbg=none guibg=none")
  -- vim.cmd("highlight FloatBorder guibg=none ctermbg=none")
  -- vim.cmd("highlight Normal guibg=none ctermbg=none")
  -- vim.cmd("highlight NonText guibg=none ctermbg=none")
  -- vim.cmd("highlight LineNr ctermbg=none guibg=none")
  -- vim.cmd("highlight SignColumn ctermbg=none guibg=none")
  -- vim.cmd("highlight FoldColumn ctermbg=none guibg=none")
  -- vim.cmd("highlight GitSignsAdd ctermbg=none guibg=none")
  -- vim.cmd("highlight GitSignsDelete ctermbg=none guibg=none")
  -- vim.cmd("highlight GitSignsChange ctermbg=none guibg=none")
  set_highlights()
  -- Add more highlight groups as needed
end

-- Apply transparency settings on colorscheme change
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = set_transparency,
})

