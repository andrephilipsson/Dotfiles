vim.opt.breakindent = true -- make wrapped lined match previous indentation
vim.opt.breakindentopt = "shift:2" -- emphasize broken lines by indenting them
vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.colorcolumn = "80" -- display vertical gray line at 80 columns
vim.opt.cursorline = true -- enable cursorline
vim.opt.emoji = false -- don't assume double width emojis
vim.opt.equalalways = false -- don't resize my splits
vim.opt.expandtab = true -- expand tabs to spaces

-- vim.opt.foldlevel

vim.opt.inccommand = "split" -- show the effects of a command as you type
vim.opt.joinspaces = false -- don't insert two spaces after joining lines
vim.opt.linebreak = true -- wrap long lines on full word
vim.opt.list = true -- show whitespace
vim.opt.mouse = "a" -- enable mouse support
vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true -- use relative line numbers
vim.opt.scrolloff = 10 -- start scrolling 10 lines before edge of viewport
vim.opt.shiftwidth = 2 -- spaces per tab when indenting
vim.opt.showmode = false -- don't show current mode, statusline does that
vim.opt.softtabstop = -1 -- use the value of "shiftwidth"
vim.opt.splitbelow = true -- open horizontal splits below
vim.opt.splitright = true -- open vertical splits to the right
vim.opt.tabstop = 2 -- use 2 spaces per when inserting tabs
vim.opt.textwidth = 80 -- wrap lines at 80 columns
vim.opt.undofile = true -- save undofiles
vim.opt.updatetime = 250 -- update signs etc. on cursor hold (default: 4000)
vim.opt.virtualedit = "block" -- allow cursor to move freely in visual mode
vim.opt.foldlevelstart = 99 -- start unfolded
vim.opt.showcmd = false -- don't show extra info at end of command line
vim.opt.showbreak = "↳ " -- DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3, UTF-8: E2 86 B3)
vim.opt.spellcapcheck = "" -- don't check for capital letters at start of sentence
vim.opt.synmaxcol = 200 -- don't bother syntax highlighting long lines
vim.opt.wildmode = "longest:full,full" -- shell-like autocomplete to unambiguous portion

-- better completion experience
--   menuone: always display popup menu, even where there's only one completion
--   noinsert: do not insert any text until the user selects a match from the menu
--   noselect: do not automatically select a match from the menu
vim.opt.completeopt = "menuone,noinsert,noselect"

-- ignore these files and folders when completing paths etc.
vim.opt.wildignore = {
  "*.class",
  "*~",
  "*.o",
  ".DS_Store",
}

-- show whitespace using these symbols
vim.opt.listchars = {
  nbsp = "⦸", -- CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
  tab = "▷┅", -- WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7) + MIDLINE HORIZONTAL ELLIPSIS (U+22EF, UTF-8: E2 8B AF)
  extends = "»", -- RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
  precedes = "«", -- LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
  trail = "•", -- BULLET (U+2022, UTF-8: E2 80 A2)
}

vim.opt.formatoptions = vim.opt.formatoptions
  + "j" -- remove comment leader when joining comments
  + "n" -- smart auto indent in lists
  - "o" -- don't insert comment leader when pressing "o" or "O"

vim.opt.shortmess = vim.opt.shortmess
  + "c" -- don't show insert completed messages
  + "I" -- disable intro messages
  + "W" -- don't show "written" or "[w]" when writing a file
  + "a" -- use abbreviated messages
  + "A" -- don't show waring about existing swapfile
  - "F" -- needed for nvim-metals

-- enable termguicolors (needs to be set before packer loads any plugins)
vim.opt.termguicolors = true
