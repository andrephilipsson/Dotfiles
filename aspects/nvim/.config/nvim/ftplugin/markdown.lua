local has_functions, functions = pcall(require, "ape.functions")
if not has_functions then
  return
end

if vim.o.loadplugins then
  ape.plugin.load("corpus")
end

functions.plaintext()
