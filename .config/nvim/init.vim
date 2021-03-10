" Disable python2
let g:loaded_python_provider=0

" Highlight yanked text
au TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false, timeout=300}

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

" Update plugins when plugin file updates.
autocmd BufWritePost plugins.lua PackerCompile
