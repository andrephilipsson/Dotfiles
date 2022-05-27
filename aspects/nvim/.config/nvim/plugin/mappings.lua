vim.g.mapleader = " "
vim.keymap.set("n", "<Space>", "<Nop>")
vim.keymap.set("n", "<Leader><Leader>", "<C-^>")

vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<Leader>q", vim.diagnostic.setloclist)

-- TODO: Find a better mapping for these
vim.keymap.set("n", "<d", vim.diagnostic.goto_prev)
vim.keymap.set("n", ">d", vim.diagnostic.goto_next)

-- Navigate the quickfix listing with <C-j> and <C-k>
-- while keeping the cursor centered and opening potential folds
vim.keymap.set("n", "<C-j>", ":cnext<CR>zzzv")
vim.keymap.set("n", "<C-k>", ":cprev<CR>zzzv")

-- Leave terminal mode with <ESC>
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")
