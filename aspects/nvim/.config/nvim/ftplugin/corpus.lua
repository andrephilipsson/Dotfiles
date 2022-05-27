vim.keymap.set("n", "<Enter>", "<Nop>")
vim.keymap.set("n", "<Enter>", ":call corpus#goto('n')<CR>", { buffer = true, silent = true })

vim.keymap.set("x", "<Enter>", "<Nop>")
vim.keymap.set("x", "<Enter>", "<Esc>:call corpus#goto('v')<CR>", { buffer = true, silent = true })
