-- Disable python2
vim.g.loaded_python_provider = 0

-- Change leader key to <Space>
vim.g.mapleader = ' '

-- Return early if packer.nvim doesn't exist.
if require('ape.packer_exists') then return end

-- Load packer.nvim file.
require('ape.plugins')

-- Load Lsp
require('ape.lsp').init()

-- Load snippets
require('ape.snippets')
