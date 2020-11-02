function s:CheckColorScheme()
  highlight clear VertSplit
  highlight link VertSplit LineNr
endfunction

autocmd FocusGained * call s:CheckColorScheme()
