set belloff=all                        " Turn of the bell
set hidden                             " Allows hiding buffers with unsaved changes

set autoindent                         " Keep indent of previous line
set linebreak                          " Wrap long lines on full word
set breakindent                        " Indent wrapped lines to match start
set breakindentopt=shift:2             " Emphasize broken lines by indenting them
set textwidth=80                       " Automatically hard wrap at 80 columns
set colorcolumn=80                     " Displays vertical gray line at 80 columns

set backspace=indent,start,eol         " Enable unlimited backspacing in insert mode
set whichwrap=b,h,l,s,<,>,[,],~        " Allow <BS>,h,l to cross line boundaries
set virtualedit=block                  " Allow cursor to move where there is no text

set nojoinspaces                       " Don't insert two spaces after special chars
set formatoptions+=j                   " Remove comment leader when joining comments
set formatoptions+=n                   " Smart auto-indent in lists

" TODO: using `verbose set formatoptions?` I can see that formatoptions is being
" last set in `/usr/share/nvim/runtime/ftplugin/`. And removing `o`
" doesn't help since it is being set somewhere else.
" So where should I put this so it doesn't get overwritten? The obvious answer
" is to put in after/ftplugin but I don't want manually to set it in every filetype. The other choice is to put it in an autocommand but I feel like there must be a more elegant solution.
set formatoptions-=o                   " Don't insert comment leader when pressing 'o' or 'O'

set expandtab                          " Convert tabs to spaces
set tabstop=2                          " Spaces per tab
set shiftwidth=2                       " Spaces per tab (when shifting)
set softtabstop=-1                     " Use the value of 'shiftwidth'
set smarttab                           " Always indent by multiple of shiftwidth

set cursorline                         " Highlight current line
set ruler                              " Use ruler
set laststatus=2                       " Always show statusline

set number                             " Show line numbers
set relativenumber                     " Use relative line numbers

set splitbelow                         " Open horizontal splits below
set splitright                         " Open vertical splits to the right
set scrolloff=5                        " Always show 5 lines under the current line
set mouse=a                            " Enable mouse support
set clipboard=unnamedplus              " Enable copy paste between vim and everything else

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

set shortmess+=c                       " For completion
set shortmess-=F                       " Needed for nvim-metals
set shortmess+=I                       " Disable intro message
set shortmess+=W                       " Don't show '[w]'/'[written]' when writing
set shortmess+=a                       " Use abbreviations in messages

" Don't show warning about an already existing swapfile
" This isn't a problem since we are using neovim which reloads a file when the
" current buffer gets focus
set shortmess+=A

set spellcapcheck=                     " Like SmartCase but for spell

set undofile                           " Save undofiles
set backupdir-=.                       " Don't save backupfiles in the current directory
set backup                             " Save backup files (stored in $XGD_DATA_HOME/nvim/backup)

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

set list                               " Show whitespace
set listchars=nbsp:⦸                   " CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
set listchars+=tab:▷┅                  " WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7)
set listchars+=extends:»               " RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
set listchars+=precedes:«              " LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
set listchars+=trail:•                 " BULLET (U+2022, UTF-8: E2 80 A2)

set wildignore=*/.git/*
set wildignore+=*.class
set wildignore+=*~

" Enable filetype detection, indentation and load plugin file
filetype indent plugin on

" Enable syntax highlighting
syntax on

set termguicolors
if exists('$BASE16_THEME')
      \ && (!exists('g:colors_name') || g:colors_name != 'base16-$BASE16_THEME')
    let base16colorspace=256
    colorscheme base16-$BASE16_THEME
endif
