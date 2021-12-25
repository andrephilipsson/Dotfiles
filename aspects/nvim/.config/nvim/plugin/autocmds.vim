" Update plugins when plugin file updates.
au BufWritePost plugins.lua PackerCompile

" Highlight yanked text
au TextYankPost * silent! lua vim.highlight.on_yank { timeout = 300 }

autocmd FileType * setlocal formatoptions-=o

autocmd CursorHold,CursorHoldI * lua require("nvim-lightbulb").update_lightbulb()

autocmd FileType tex lua require("cmp").setup.buffer {
\   sources = {
\     { name = 'latex_symbols' }
\   }
\ }

autocmd FileType tex,markdown,text,gitcommit lua require("cmp").setup.buffer {
\   sources = {
\     { name = 'spell', keyword_length = 5 },
\     { name = 'emoji' }
\   }
\ }
