" Update plugins when plugin file updates.
au BufWritePost plugins.lua PackerCompile

" Highlight yanked text
au TextYankPost * silent! lua vim.highlight.on_yank { timeout = 300 }

" Enable the autocompletion in all buffers
au BufEnter * lua require'completion'.on_attach()

augroup LspAutocommands
  au!
  au ColorScheme * lua require'ape.lsp'.set_up_highlights()
  au WinEnter * lua require'ape.lsp'.bind()
augroup END
