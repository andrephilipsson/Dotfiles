-- Disable built-in plugins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

require("ape.mappings")
require("ape.plugins")
require("ape.colors")
require("ape.statusline")
require("ape.git")
require("ape.indent")
require("ape.completion")
require("ape.lsp")
require("ape.comment")
require("ape.treesitter")
require("ape.nvim-tree")
