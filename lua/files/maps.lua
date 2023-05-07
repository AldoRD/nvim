local keymap = vim.keymap

vim.g.mapleader = ";"

keymap.set("n", "x", '"_x')

-- Increment / Decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete word backwards
keymap.set("n", "dw", 'vb"_d')

-- Explorer
keymap.set("n", "sf", "<Cmd>CocCommand explorer<CR>")

-- Search & Replace
keymap.set("n", "<leader>qe", "<cmd>lua require('spectre').open()<CR>")
keymap.set("n", "<leader>qw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>")

-- Motion
keymap.set("n", "nw", "<Cmd>HopWord<CR>")
keymap.set("n", "nc", "<Cmd>HopChar2<CR>")
keymap.set("n", "nl", "<Cmd>HopLine<CR>")
keymap.set("n", "np", "<Cmd>HopPattern<CR>")

-- Movements in Insert Mode
keymap.set("i", "<M-h>", "<C-o>h")
keymap.set("i", "<M-j>", "<C-o>j")
keymap.set("i", "<M-k>", "<C-o>k")
keymap.set("i", "<M-l>", "<C-o>l")

-- Moving Text
vim.cmd([[ 
  xnoremap K :move '<-2<CR>gv-gv
  xnoremap J :move '>+1<CR>gv-gv
]])

-- Select All
keymap.set("n", "<C-a>", "gg<S-v>G")

-- New Tab
keymap.set("n", "te", ":tabedit")

-- Split Window
keymap.set("n", "ss", ":split<Return><C-w>w")
keymap.set("n", "sv", ":vsplit<Return><C-w>w")

-- Move Window
keymap.set("n", "<Space>", "<C-w>w")
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize Windows
keymap.set("n", "<C-left>", "<C-w><")
keymap.set("n", "<C-right>", "<C-w>>")
keymap.set("n", "<C-up>", "<C-w>+")
keymap.set("n", "<C-down>", "<C-w>-")
