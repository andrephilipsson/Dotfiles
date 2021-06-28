local o = vim.opt

o.breakindent    = true          -- Make wrapped lines match previous indentation
o.breakindentopt = "shift:2"     -- Emphasize broken lines by indenting them
o.clipboard      = "unnamedplus" -- Use system clipboard
o.colorcolumn    = "80"          -- Display vertical gray line at 80 columns
o.cursorline     = true          -- Enable cursorline
o.equalalways    = false         -- Don't resize my splits
o.expandtab      = true          -- Convert tabs to spaces
o.hidden         = true          -- Allow hiding buffers with unsaved changes
o.inccommand     = "nosplit"     -- Show the effects of a command as you type
o.joinspaces     = false         -- Don't insert two spaces after joining lines
o.linebreak      = true          -- Wrap long lines on full word
o.list           = true          -- Show whitespace
o.mouse          = "a"           -- Enable mouse support
o.number         = true          -- Show line numbers
o.relativenumber = true          -- Use relative line numbers
o.scrolloff      = 10            -- Always show 10 lines under the current line
o.shiftwidth     = 2             -- Spaces per tab when indenting
o.showmode       = false         -- Don't show current mode. Statusline does that
o.softtabstop    = -1            -- Use the value of "shiftwidth"
o.splitbelow     = true          -- Open horizontal splits below
o.splitright     = true          -- Open vertical splits to the right
o.tabstop        = 2             -- Spaces per tab
o.textwidth      = 80            -- Wrap lines at 80 columns
o.virtualedit    = "block"       -- Allow cursor to move freely in visual mode
o.signcolumn     = "yes:1"       -- Always display signcolumn (max 1 sign)
o.updatetime     = 500           -- Update signs etc. on cursor hold. Default 4000

o.undofile = true        -- Save undofiles
o.backup   = true        -- Save backup files
o.backupdir:remove(".")  -- Don't save backup files in the current directory
-- TODO: create backup, swap, and undo dirs if they don't exist

-- For a better completion experience
o.completeopt = "menuone,noinsert,noselect"

-- Ignore these files
o.wildignore  = {"*/.git/*", "*.class", "*~"}

o.wildmode = {
  "longest", -- Complete till longest common string...
  "full"     -- ...then full word
}

-- Show whitespace with these symbols
o.listchars = {nbsp = "⦸", tab = "▷┅", extends = "»", precedes = "«", trail = "•"}

o.formatoptions = o.formatoptions
                    + "j" -- Remove commend leader when joining comments
                    + "n" -- Smart auto indent in lists
                    - "o" -- Don't insert comment leader when pressing "o" or "O"

o.shortmess = o.shortmess
                + "c" -- For nicer completion
                + "I" -- Disable intro messages
                + "W" -- Don't show "written" or "[w]" when writing a file
                + "a" -- Use abbreviated messages
                + "A" -- Don't show waring about existing swapfile
                - "F" -- Needed for nvim-metals

-- Disable python2
vim.g.loaded_python_provider = 0

-- Disable netrw
vim.g.loaded_netrwPlugin = 1

-- Change leader key to <Space>
vim.g.mapleader = " "

-- Enable termguicolors (needs to be set before packer loads any plugins)
o.termguicolors = true
