-- Load options
require("ape.options")

-- Load utils
require("ape.utils")

-- Return early if packer.nvim doesn't exist.
if require("ape.packer_exists") then return end

-- Load packer.nvim file.
require("ape.plugins")

-- Setup autocompletion
require("ape.completion")

-- Statusline
require("ape.statusline")

-- Load Lsp
require("ape.lsp").setup()

-- For debugging code
require("ape.dap")

-- Treesitter
require("ape.treesitter")

-- Load snippets
require("ape.snips")
