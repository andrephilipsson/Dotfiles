vim.cmd("highlight Comment " .. require'wincent.pinnacle'.italicize("Comment"))

-- Make current line nr stand out
vim.cmd("highlight clear CursorLineNr")
vim.cmd("highlight link CursorLineNr DiffText")
