filetype indent plugin on
syntax on
set belloff=all                 " Turn of the bell
set hidden                      " Allows hiding buffers with unsaved changes

set autoindent                  " Keep indent of previous line
set linebreak                   " Wrap long lines on full word
set breakindent                 " Indent wrapped lines to match start
set breakindentopt=shift:2      " Emphasize broken lines by indenting them
set textwidth=79                " Automatically hard wrap at 79 columns

set backspace=indent,start,eol  " Enable unlimited backspacing in insert mode
set whichwrap=b,h,l,s,<,>,[,],~ " Allow <BS>,h,l to cross line boundaries
set virtualedit=block           " Allow cursor to move where there is no text

set formatoptions+=j            " Remove comment leader when joining comments
set nojoinspaces                " Don't insert two spaces after special chars 

set expandtab                   " Convert tabs to spaces
set tabstop=2                   " Spaces per tab
set shiftwidth=2                " Spaces per tab (when shifting)
set softtabstop=-1              " Use the value of 'shiftwidth' 
set smarttab                    " Always indent by multiple of shiftwidth

set cursorline                  " Highlight current line
set ruler                       " Use ruler
set laststatus=2                " Always show statusline

set number                      " Show line numbers
set relativenumber              " Use relative line numbers

set splitbelow                  " Open horizontal splits below
set splitright                  " Open vertical splits to the right
set scrolloff=3                 " Always show 3 lines under the current line
