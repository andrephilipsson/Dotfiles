M = {}

M.spell = function()
  vim.wo.spell = true
  vim.bo.spelllang = "sv,en"
end

M.plaintext = function()
  vim.wo.concealcursor = "nc"
  vim.wo.list = false
  vim.bo.textwidth = 0
  vim.wo.wrap = true
  vim.bo.wrapmargin = 0
  vim.wo.breakindentopt = ""

  M.spell()

  vim.keymap.set("n", "j", "gj", { buffer = true })
  vim.keymap.set("n", "k", "gk", { buffer = true })

  -- Undo breakpoints
  vim.keymap.set("i", ",", ",<C-g>u", { buffer = true })
  vim.keymap.set("i", ".", ".<C-g>u", { buffer = true })
  vim.keymap.set("i", "?", "?<C-g>u", { buffer = true })
  vim.keymap.set("i", "!", "!<C-g>u", { buffer = true })
end

return M
