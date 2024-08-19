local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- global variables
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.dap_virtual_text = true
vim.g.slime_target = "nvim"

-- ******** --

-- Modes
--  Normal mode = "n"
--  Insert mode = "i"
--  Visual mode = "v"
--  Visual block mode = "x"
--  Term mode = "t"
--  Command mode = "c"

-- ******** --

-- Normal mode configurations --

-- Window navigation
keymap("n", "<leader>sv", ":vsplit<CR>", opts)
keymap("n", "<leader>sh", ":split<CR>", opts)

-- Undo
keymap("n", "<leader>u", ":undo<CR>", opts)

-- Buffer navigations
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Tab navigations
keymap("n", "<C-t>", ":tabnew<CR>", opts)   -- open new tab
keymap("n", "<C-w>", ":tabclose<CR>", opts) -- close current tab
keymap("n", "<C-]>", ":tabn<CR>", opts)     --  go to next tab
keymap("n", "<C-[>", ":tabp<CR>", opts)     --  go to previous tab

-- Window resizing
keymap("n", "<C-u>", ":resize +2<CR>", opts)
keymap("n", "<C-i>", ":resize -2<CR>", opts)
keymap("n", "<C-o>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-p>", ":vertical resize +2<CR>", opts)

-- Navigate buffer
keymap("n", "<S-bp>", ":bprevious<CR>", opts)
keymap("n", "<S-bn>", ":bnext<CR>", opts)

-- Visual mode configurations --

-- Indentation
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Paste text
keymap("v", "p", '"_dP', opts)
