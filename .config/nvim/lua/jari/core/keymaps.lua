vim.g.mapleader = " "
-- Shorten function name
local keymap = vim.keymap

local opts = { noremap = true, silent = true }
--Remap space as leader key
keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move window up" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move window right" })
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move window left" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move window down" })
keymap.set("n", "f", ":Pounce<cr>", { desc = "Incremental search + jump" })

-- Resize with arrows
keymap.set("n", "<C-Up>", ":resize -2<CR>", { desc = "resize window" })
keymap.set("n", "<C-Down>", ":resize +2<CR>", { desc = "resize window" })
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "resize window" })
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "resize window" })

-- Navigate buffers
keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "next buffer" })
keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "previous buffer" })

-- Move text up and down
keymap.set("n", "<A-j>", "<Esc>:m .+1<CR>", { desc = "move line down" })
keymap.set("n", "<A-k>", "<Esc>:m .-2<CR>", { desc = "move line up" })

-- Insert --
-- Press jk or kj fast to enter normal mode
for _, mode in ipairs({ "i", "v", "x", "t" }) do
	keymap.set(mode, "jk", "<ESC>", { desc = "back to normal mode" })
	keymap.set(mode, "jk", "<ESC>", { desc = "back to normal mode" })
	keymap.set(mode, "kj", "<ESC>", { desc = "back to normal mode" })
	keymap.set(mode, "kj", "<ESC>", { desc = "back to normal mode" })
end

-- Visual --
-- Stay in indent mode
keymap.set("v", "<", "<gv", { desc = "Stay in indent mode" })
keymap.set("v", ">", ">gv", { desc = "Stay in indent mode" })
