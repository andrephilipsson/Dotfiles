-- telescope mappings
vim.keymap.set("n", "<Leader>ff", function()
  R("ape.telescope").find_files()
end)
vim.keymap.set("n", "<Leader>fh", function()
  R("ape.telescope").help_tags()
end)
vim.keymap.set("n", "<Leader>fg", function()
  R("ape.telescope").live_grep()
end)
vim.keymap.set("n", "<Leader>fm", function()
  R("ape.telescope").man_pages()
end)
vim.keymap.set("n", "<Leader>fl", function()
  R("ape.telescope").current_buffer_fuzzy_find()
end)

-- open and close folds with Tab
vim.keymap.set("n", "<Tab>", "za")

vim.keymap.set("n", "<F6>", "<C-i>")

-- quick save
vim.keymap.set("n", "<Leader>w", ":w<CR>")

-- navigate the quickfix listing with <C-j> and <C-k>
-- while keeping the cursor centered and opening potential folds
vim.keymap.set("n", "<C-j>", ":cnext<CR>zzzv")
vim.keymap.set("n", "<C-k>", ":cprev<CR>zzzv")

-- leave terminal mode with <ESC>
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")
