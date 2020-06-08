function statusline#filepath()
  let l:basename = expand("%:h")
  
  if l:basename ==# "" || l:basename ==# "."
    return ""
  else
    return fnamemodify(l:basename, ":~:.") . "/"
  endif
endfunction

function statusline#spell()
  let l:on = &spell
  if l:on ==# "nospell"
    return ""
  else
    return " [" . &spelllang . "]"
  endif
endfunction

function statusline#color()
  let bgcolor = synIDattr(hlID("StatusLine"), "bg#") 

  if &termguicolors
    let group = "guibg="
  else
    let group = "ctermbg="
  endif

  execute "highlight User1 cterm=italic gui=italic " . group . bgcolor
  execute "highlight User2 cterm=bold gui=bold " . group . bgcolor
endfunction

function statusline#ft()
  if strlen(&ft)
    if &ro == 1
      return "[" . &ft . ",ro" . "]"
    else
      return "[" . &ft . "]"
    endif
  else
    return ""
  endif
endfunction

function statusline#right()
  let l:status = " "

  let l:curCol = virtcol(".")
  let l:maxCol = virtcol("$")
  let l:curLine = line(".")
  let l:maxLine = line("$")

  let l:padding = l:maxLine - l:curLine
  if (l:padding)
    let l:status.=repeat(" ", l:padding)
  endif

  let l:status.="l "
  let l:status.=l:curLine
  let l:status.="/"
  let l:status.=l:maxLine
  let l:status.=" c "
  let l:status.=l:curCol
  let l:status.="/"
  let l:status.=l:maxCol

  if len(l:curCol) < 2
    let l:status.=' '
  endif
  if len(l:maxCol) < 2
    let l:status.=' '
  endif

  return l:status
endfunction

call statusline#color()

" Update the statusline color when termguicolors is set or when a new
" colorscheme is selected
autocmd ColorScheme * call statusline#color()
