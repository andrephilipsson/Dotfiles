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

augroup lsp
  au!
  au FileType java lua require("jdtls").start_or_attach({cmd = {"java-lsp.sh"}})
augroup end

au FileType dap-repl lua require("dap.ext.autocompl").attach()

autocmd FileType * setlocal formatoptions-=o

autocmd CursorHold,CursorHoldI * lua require("nvim-lightbulb").update_lightbulb()

autocmd FileType tex lua require("cmp").setup.buffer {
\   sources = {
\     { name = 'latex_symbols' }
\   }
\ }

autocmd FileType tex,markdown,text lua require("cmp").setup.buffer {
\   sources = {
\     { name = 'spell', keyword_length = 5 },
\     { name = 'emoji' }
\   }
\ }
