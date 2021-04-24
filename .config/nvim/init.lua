-- Disable python2
vim.g.loaded_python_provider = 0

-- Change leader key to <Space>
vim.g.mapleader = ' '

-- Load options
require("ape.options")

-- Load utils
require("ape.utils")

-- Return early if packer.nvim doesn't exist.
if require('ape.packer_exists') then return end

-- Load packer.nvim file.
require('ape.plugins')

-- Statusline
require("ape.statusline")

-- Load Lsp
require('ape.lsp').init()

-- Load snippets
require('ape.snips')

vim.g.hardtime_default_on = 1
