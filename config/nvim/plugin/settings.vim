set belloff=all                        " Turn of the bell
set hidden                             " Allows hiding buffers with unsaved changes

set autoindent                         " Keep indent of previous line
set linebreak                          " Wrap long lines on full word
set breakindent                        " Indent wrapped lines to match start
set breakindentopt=shift:2             " Emphasize broken lines by indenting them
set textwidth=79                       " Automatically hard wrap at 79 columns

set backspace=indent,start,eol         " Enable unlimited backspacing in insert mode
set whichwrap=b,h,l,s,<,>,[,],~        " Allow <BS>,h,l to cross line boundaries
set virtualedit=block                  " Allow cursor to move where there is no text

set formatoptions+=j                   " Remove comment leader when joining comments
set nojoinspaces                       " Don't insert two spaces after special chars

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
set scrolloff=3                        " Always show 3 lines under the current line
set mouse=a                            " Enable mouse support
set clipboard=unnamedplus              " Enable copy paste between vim and everything else

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
set shortmess-=F                       " Needed for nvim-metals
set shortmess+=I                       " Disable intro message

set list                               " show whitespace
set listchars=nbsp:⦸                   " CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
set listchars+=tab:▷┅                  " WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7)
                                       " + BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)
set listchars+=extends:»               " RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
set listchars+=precedes:«              " LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
set listchars+=trail:•                 " BULLET (U+2022, UTF-8: E2 80 A2)

set termguicolors
if exists('$BASE16_THEME')
      \ && (!exists('g:colors_name') || g:colors_name != 'base16-$BASE16_THEME')
    let base16colorspace=256
    colorscheme base16-$BASE16_THEME
endif
