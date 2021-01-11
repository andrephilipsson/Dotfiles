" Disable python2
let g:loaded_python_provider=0
let g:python3_host_prog="~/.local/share/nvim/neovim-virtualenv/bin/python"

" Change leader key to <Space>
let mapleader="\<Space>"

" Load plugins
if &loadplugins
  packadd! base16-vim
  packadd! command-t
  packadd! completion-nvim
  packadd! corpus
  packadd! nvim-lspconfig
  packadd! nvim-metals
  packadd! pinnacle
  packadd! tcomment_vim
  packadd! ultisnips
endif

" Highlight yanked text
au TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false, timeout=300}

" Enable filetype detection, indentation and load plugin file
filetype indent plugin on

" Enable syntax highlighting
syntax on
