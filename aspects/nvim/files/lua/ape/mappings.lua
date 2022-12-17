vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "<Space>", "<Nop>")

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "<Leader><Leader>", "<C-^>")

-- Navigate the quickfix listing with <C-j> and <C-k>
-- while keeping the cursor centered and opening potential folds
vim.keymap.set("n", "<C-j>", ":cnext<CR>zzzv")
vim.keymap.set("n", "<C-k>", ":cprev<CR>zzzv")

-- Leave terminal mode with <ESC>
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")
