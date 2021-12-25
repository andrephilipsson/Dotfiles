local nnoremap = require("astronauta.keymap").nnoremap
local tnoremap = require("astronauta.keymap").tnoremap

-- telescope mappings
nnoremap { "<Leader>ff", require("ape.telescope").find_files }
nnoremap { "<Leader>fh", require("ape.telescope").help_tags }
nnoremap { "<Leader>fg", require("ape.telescope").live_grep }


-- open and close folds with Tab
nnoremap { "<Tab>", "za" }

nnoremap { "<F6>", "<C-i>" }

-- quick save
nnoremap { "<Leader>w", ":w<CR>" }

-- navigate the quickfix listing with <C-j> and <C-k>
-- while keeping the cursor centered and opening potential folds
nnoremap { "<C-j>", ":cnext<CR>zzzv" }
nnoremap { "<C-k>", ":cprev<CR>zzzv" }

-- leave terminal mode with <ESC>
tnoremap { "<ESC>", "<C-\\><C-n>" }
