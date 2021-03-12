vim.g.CommandTCancelMap = { "<ESC>", "<C-c>" }
vim.g.CommandTEncoding = "UTF-8"
vim.g.CommandTFileScanner = "watchman"
vim.g.CommandTInputDebounce = 50
vim.g.CommandTMaxCachedDirectories = 10
vim.g.CommandTMaxFiles = 1000000

-- Index dot-directories
vim.g.CommandTScanDotDirectories = 1

-- Use current working directory as base path
vim.g.CommandTTraverseSCM = "pwd"

-- Ignore these files
vim.g.CommandTWildIgnore = ""
  .. vim.o.wildignore
  .. ",*/tmp/*"
  .. ",*/target/*"
  .. ",*/node_modules/*"


local nmap = vim.keymap.nmap

-- Search the help docs with <Space> + [h]elp
nmap { "<Leader>h", "<Plug>(CommandTHelp)", { unique = true } }
-- Search for lines in the current file with <Space> + [l]ines
nmap { "<Leader>l", "<Plug>(CommandTLine)", { unique = true } }
