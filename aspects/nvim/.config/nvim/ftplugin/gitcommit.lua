local has_functions, functions = pcall(require, "ape.functions")
if not has_functions then
  return
end

functions.plaintext()

vim.wo.colorcolumn = "72"
vim.bo.textwidth = 72
