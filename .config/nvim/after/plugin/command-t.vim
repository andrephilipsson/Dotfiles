" Tell Command-T to use 'find' instead of 'ruby' for indexing
let g:CommandTFileScanner="find"

" Let Command-T index .files
let g:CommandTScanDotDirectories=1

let g:CommandTMaxCachedDirectories=10

let g:CommandTMaxFiles=1000000

let g:CommandTCancelMap=['<ESC>', '<C-c>']

let g:CommandTWildIgnore=&wildignore
let g:CommandTWildIgnore.=",*/.git/*"
let g:CommandTWildIgnore.=",*/tmp/*"
let g:CommandTWildIgnore.=",*/Böcker/*"
let g:CommandTWildIgnore.=",*/Film/*"
let g:CommandTWildIgnore.=",*/Musik/*"
