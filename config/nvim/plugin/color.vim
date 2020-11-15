function! s:base16_customize() abort
  call Base16hi("VertSplit", g:base16_gui03, g:base16_gui01, g:base16_cterm03, g:base16_cterm01, "", "")
endfunction

augroup on_change_colorschema
  autocmd!
  autocmd ColorScheme * call s:base16_customize()
augroup END

execute 'highlight Comment ' . luaeval("require'wincent.pinnacle'.italicize('Comment')")
