execute 'highlight Comment ' . luaeval("require'wincent.pinnacle'.italicize('Comment')")

" Make current line nr stand out
highlight clear CursorLineNr
highlight link CursorLineNr DiffText
