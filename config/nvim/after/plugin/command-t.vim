let g:CommandTCancelMap=["<ESC>", "<C-c>"] " Close file listing with <Esc>

let g:CommandTEncoding="UTF-8"
let g:CommandTFileScanner="find"	   " Use 'find' instead of 'ruby' to index files
let g:CommandTInputDebounce=50		   " Add 50ms delay before listing updates
let g:CommandTMaxCachedDirectories=10	   " Number of cached directories for faster searches
let g:CommandTMaxFiles=1000000		   " Maximum number of indexed files
let g:CommandTScanDotDirectories=1	   " Index dot-directories

let g:CommandTTraverseSCM="pwd"            " Use current working directory as base path

let g:CommandTWildIgnore=&wildignore
let g:CommandTWildIgnore.=",*/.git/*"
let g:CommandTWildIgnore.=",*/tmp/*"
let g:CommandTWildIgnore.=",*.class"
