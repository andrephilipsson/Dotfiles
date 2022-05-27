vim.g.mapleader = " "
vim.keymap.set("n", "<Space>", "<Nop>")
vim.keymap.set("n", "<Leader><Leader>", "<C-^>")

vim.keymap.set("n", "<Leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<Leader>q", vim.diagnostic.setloclist)

-- TODO: Find a better mapping for these
vim.keymap.set("n", "<d", vim.diagnostic.goto_prev)
vim.keymap.set("n", ">d", vim.diagnostic.goto_next)

vim.keymap.set("n", "<C-n>", ":cnext<CR>")
vim.keymap.set("n", "<C-p>", ":cprev<CR>")
