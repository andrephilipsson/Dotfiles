" Disable python2
let g:loaded_python_provider=0

" Change leader key to <Space>
let mapleader="\<Space>"

" Load plugins
if &loadplugins
  packadd! base16-vim
  packadd! command-t
  packadd! completion-nvim
  packadd! corpus
  packadd! markdown-preview.nvim
  packadd! nvim-lspconfig
  packadd! nvim-metals
  packadd! nvim-treesitter
  packadd! pinnacle
  packadd! tabular
  packadd! tcomment_vim
  packadd! ultisnips
  packadd! vim-dirvish
  packadd! vim-fugitive
  packadd! vim-surround
endif

" Highlight yanked text
au TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false, timeout=300}

" Enable filetype detection, indentation and load plugin file
filetype indent plugin on

" Enable syntax highlighting
syntax on
