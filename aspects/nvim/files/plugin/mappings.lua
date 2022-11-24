vim.g.mapleader = " "
vim.keymap.set("n", "<Space>", "<Nop>")
vim.keymap.set("n", "<Leader><Leader>", "<C-^>")

-- Navigate the quickfix listing with <C-j> and <C-k>
-- while keeping the cursor centered and opening potential folds
vim.keymap.set("n", "<C-j>", ":cnext<CR>zzzv")
vim.keymap.set("n", "<C-k>", ":cprev<CR>zzzv")

-- Leave terminal mode with <ESC>
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")
