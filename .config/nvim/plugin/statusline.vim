set statusline=%{statusline#filepath()}
set statusline+=%2*
set statusline+=%t
set statusline+=%1*
set statusline+=\ 
set statusline+=%{statusline#ft()}
set statusline+=%{statusline#spell()}
set statusline+=%0*

set statusline+=%=

set statusline+=%{statusline#right()}
