" Update plugins when plugin file updates.
au BufWritePost plugins.lua PackerCompile

" Highlight yanked text
au TextYankPost * silent! lua vim.highlight.on_yank { timeout = 300 }

augroup LspAutocommands
  au!
  au WinEnter * lua require'ape.lsp'.bind()
augroup END

augroup MetalsLsp
  au!
  au FileType scala,sbt lua require("metals").initialize_or_attach(Metals_config())
augroup end

au FileType dap-repl lua require("dap.ext.autocompl").attach()
