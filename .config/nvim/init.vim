" Disable python2
lua vim.g.loaded_python_provider = 0

" Enable filetype detection, indentation and load plugin file
filetype indent plugin on

" Enable syntax highlighting
syntax on

" Change leader key to <Space>
lua vim.g.mapleader = ' '

" Return early if packer.nvim doesn't exist.
lua if require('ape.packer_exists') then return end

" Load packer.nvim file.
lua require('ape.plugins')

" Load Lsp
lua require('ape.lsp').init()
