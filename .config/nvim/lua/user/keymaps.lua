local opts = { noremap = true, silent = true }


-- Shorten function name
local map = vim.api.nvim_set_keymap

--Remap space as leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
map("", "<capslock>", "<esc>", opts)


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
--[[
-- Same postition after J -- ]]
map("n", "J", "mzJ`z", opts)

-- Move selected lines up/down --
map("v", "<S-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<S-k>", ":m '<-2<CR>gv=gv", opts)


-- Quick nav in Qlist --
map("n", "<leader>fk", ":cprev<cr>", opts)
map("n", "<leader>fj", ":cnext<cr>", opts)

-- Save all files --
map("n", "<leader>w", ":wa!<CR>", opts)

-- Telescope --
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>fl", "<cmd>Telescope live_grep<cr>", opts)
map("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", opts)
map("n", "<leader>fs", "<cmd>Telescope resume<cr>", opts)
-- quick search selected word --
map("v", "<leader>f", "y<ESC>:Telescope live_grep default_text=<c-r>0<CR>", opts)

-- show commits --
map("n", "<leader>gb", "y<ESC>:Telescope git_branches<CR>", opts)
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
