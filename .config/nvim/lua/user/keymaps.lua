local opts = { noremap = true, silent = true }


-- Shorten function name
local map = vim.api.nvim_set_keymap

--Remap space as leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- move between windows --
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)


-- move in insert mode --
map("i", "<C-h>", "<Left>", opts)
map("i", "<C-j>", "<Down>", opts)
map("i", "<C-k>", "<Up>", opts)
map("i", "<C-l>", "<Right>", opts)

-- splits --
map("n", "<leader>sv", "<C-w>v", opts)
map("n", "<leader>sh", "<C-w>s", opts)
map("n", "<leader>se", "<C-w>=", opts)

-- terminals --
map("n", "<leader>v\\", ":vert term", {})
map("n", "<leader>h\\", ":hor term", {})

-- close buffers --
map("n", "<leader>xa", "<cmd>:enew|bd#<cr>", opts)
map("n", "<leader>x", "<cmd>:close<cr>", opts)

-- Quit --
map("n", "<leader>qq", ":qall!<CR>", opts)

-- Resize with arrows --
map("n", "<A-k>", ":resize -4<CR>", opts)
map("n", "<A-j>", ":resize +4<CR>", opts)
map("n", "<A-h>", ":vertical resize -4<CR>", opts)
map("n", "<A-l>", ":vertical resize +4<CR>", opts)

-- PL layout fix in ghostty
map("n", "Ż", ":resize +4<CR>", opts)
map("n", "∆", ":resize -4<CR>", opts)
map("n", "ķ", ":vertical resize -4<CR>", opts)
map("n", "ł", ":vertical resize +4<CR>", opts)

--[[ Same postition after J -- ]]
map("n", "J", "mzJ`z", opts)

-- Move selected lines up/down --
map("v", "<S-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<S-k>", ":m '<-2<CR>gv=gv", opts)

map("n", "<leader>aw", "gg<S-v>G", opts)


-- Quick nav in Qlist --
map("n", "<leader>fk", ":cprev<cr>", opts)
map("n", "<leader>fj", ":cnext<cr>", opts)

-- Save all files --
map("n", "<leader>w", ":wa!<CR>", opts)

map("n", "<leader>m", '<cmd>s/\\%V\\(.*\\)\\%V/"\\1"/<cr>', opts)

-- mini --
map("n", "<leader>f<tab>", ':lua require("mini.files").open(vim.api.nvim_buf_get_name(0), true)<CR>', opts)
map("n", "<leader><tab>", '::lua require("mini.files").open(vim.loop.cwd(), true)<CR>', opts)

-- Nohl --
map("n", "<leader>,", ":nohlsearch<CR>", opts)
map("n", "<leader>u", ":UndotreeToggle<CR>", opts)

-- tabs --
map("n", "<leader>tn", "<cmd>tabnext<cr>", opts)
map("n", "<leader>tp", "<cmd>tabprev<cr>", opts)

map("n", "<leader>ll", "<cmd>lua vim.diagnostic.setqflist()<cr>", opts)

map("n", "<leader>fr", "<Plug>CtrlSFPrompt", {noremap = true})
map("v", "<leader>fr", "<Plug>CtrlSFVwordExec", opts)
map("n", "<leader>r\\", "<cmd>CtrlSFToggle<cr>", opts)

--debug theme--
-- map("n", "<C-e>", "<cmd>lua print(vim.inspect(vim.treesitter.get_captures_at_cursor(0)))<cr>", { noremap = true, silent = false })
map("n", "<leader>rc", "<cmd>Lazy reload posterpole.nvim<cr>", opts)
