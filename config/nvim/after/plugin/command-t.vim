" Close file listing with <Esc>
let g:CommandTCancelMap=["<ESC>", "<C-c>"]

let g:CommandTEncoding="UTF-8"
let g:CommandTFileScanner="watchman"
" Add 50ms delay before listing updates
let g:CommandTInputDebounce=50
let g:CommandTMaxCachedDirectories=10
let g:CommandTMaxFiles=1000000
let g:CommandTScanDotDirectories=1     " Index dot-directories

" Use current working directory as base path
let g:CommandTTraverseSCM="pwd"

" Ignore these files
let g:CommandTWildIgnore=&wildignore
let g:CommandTWildIgnore.=",*/.git/*"
let g:CommandTWildIgnore.=",*/tmp/*"
let g:CommandTWildIgnore.=",*.class"
let g:CommandTWildIgnore.=",*/target/*"

" Search the help docs with <Space> + h
nmap <unique> <Leader>h <Plug>(CommandTHelp)
" Search for lines in the current file with <Space> + l
nmap <unique> <Leader>l <Plug>(CommandTLine)
