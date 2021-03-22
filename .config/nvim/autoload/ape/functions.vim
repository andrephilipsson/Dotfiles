" Turn on spell-checking
function! ape#functions#spell() abort
  if has('syntax')
    setlocal spell
    setlocal spelllang=sv,en
  endif
endfunction

" Switch to plaintext mode with: call functions#plaintext()
function! ape#functions#plaintext() abort
  if has('conceal')
    setlocal concealcursor=nc
  endif
  setlocal nolist
  setlocal textwidth=0
  setlocal wrap
  setlocal wrapmargin=0
  setlocal breakindentopt=""

  call ape#functions#spell()

  nnoremap <buffer> j gj
  nnoremap <buffer> k gk
endfunction
