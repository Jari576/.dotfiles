vim.g.mapleader = " "
-- Shorten function name
local keymap = vim.keymap

--Remap space as leader key

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-k>", "<C-w>k", { desc = "Move window up" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move window right" })
keymap("n", "<C-h>", "<C-w>h", { desc = "Move window left" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move window down" })
keymap("n", "f", ":Pounce<cr>", { desc = "Incremental search + jump" })

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", { desc = "resize window" })
keymap("n", "<C-Down>", ":resize +2<CR>", { desc = "resize window" })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "resize window" })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "resize window" })

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", { desc = "next buffer" })
keymap("n", "<S-h>", ":bprevious<CR>", { desc = "previous buffer" })

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>", { desc = "move line down" })
keymap("n", "<A-k>", "<Esc>:m .-2<CR>", { desc = "move line up" })

-- Insert --
-- Press jk or kj fast to enter normal mode
for _, mode in ipairs({ "i", "v", "x", "t" }) do
	keymap(mode, "jk", "<ESC>", { desc = "back to normal mode" })
	keymap(mode, "jk", "<ESC>", { desc = "back to normal mode" })
	keymap(mode, "kj", "<ESC>", { desc = "back to normal mode" })
	keymap(mode, "kj", "<ESC>", { desc = "back to normal mode" })
end

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", { desc = "Stay in indent mode" })
keymap("v", ">", ">gv", { desc = "Stay in indent mode" })

