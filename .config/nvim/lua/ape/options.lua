local opt = vim.opt

opt.breakindent    = true          -- Make wrapped lines match previous indentation
opt.breakindentopt = "shift:2"     -- Emphasize broken lines by indenting them
opt.clipboard      = "unnamedplus" -- Use system clipboard
opt.colorcolumn    = "80"          -- Display vertical gray line at 80 columns
opt.cursorline     = true          -- Enable cursorline
opt.equalalways    = false         -- Don't resize my splits
opt.expandtab      = true          -- Convert tabs to spaces
opt.hidden         = true          -- Allow hiding buffers with unsaved changes
opt.inccommand     = "nosplit"     -- Show the effects of a command as you type
opt.joinspaces     = false         -- Don't insert two spaces after joining lines
opt.linebreak      = true          -- Wrap long lines on full word
opt.list           = true          -- Show whitespace
opt.mouse          = "a"           -- Enable mouse support
opt.number         = true          -- Show line numbers
opt.relativenumber = true          -- Use relative line numbers
opt.scrolloff      = 10            -- Always show 10 lines under the current line
opt.shiftwidth     = 2             -- Spaces per tab when indenting
opt.showmode       = false         -- Don't show current mode. Statusline does that
opt.softtabstop    = -1            -- Use the value of "shiftwidth"
opt.splitbelow     = true          -- Open horizontal splits below
opt.splitright     = true          -- Open vertical splits to the right
opt.tabstop        = 2             -- Spaces per tab
opt.textwidth      = 80            -- Wrap lines at 80 columns
opt.virtualedit    = "block"       -- Allow cursor to move freely in visual mode
opt.signcolumn     = "yes:1"       -- Always display signcolumn (max 1 sign)

opt.undofile = true       -- Save undofiles
opt.backup   = true       -- Save backup files
opt.backupdir:remove(".") -- Don't save backup files in the current directory

-- For a better completion experience
opt.completeopt = "menuone,noinsert,noselect"

-- Ignore these files
opt.wildignore  = {"*/.git/*", "*.class", "*~"}

opt.wildmode = {
  "longest", -- Complete till longest common string...
  "full"     -- ...then full word
}

-- Show whitespace with these symbols
opt.listchars = {nbsp = "⦸", tab = "▷┅", extends = "»", precedes = "«", trail = "•"}

opt.formatoptions = opt.formatoptions
                    + "j" -- Remove commend leader when joining comments
                    + "n" -- Smart auto indent in lists
                    - "o" -- Don't insert comment leader when pressing "o" or "O"

opt.shortmess = opt.shortmess
                + "c" -- For nicer completion
                + "I" -- Disable intro messages
                + "W" -- Don't show "written" or "[w]" when writing a file
                + "a" -- Use abbreviated messages
                + "A" -- Don't show waring about existing swapfile
                - "F" -- Needed for nvim-metals

opt.termguicolors = true

-- Disable python2
vim.g.loaded_python_provider = 0

-- Disable netrw
vim.g.loaded_netrwPlugin = 1

-- Change leader key to <Space>
vim.g.mapleader = " "
