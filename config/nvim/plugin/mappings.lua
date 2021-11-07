local nnoremap = require("astronauta.keymap").nnoremap
local tnoremap = require("astronauta.keymap").tnoremap

-- Open and close folds with Tab
nnoremap { "<Tab>", "za" }

nnoremap { "<F6>", "<C-i>" }

-- I never use Ex mode
nnoremap { "Q", "<Nop>"}

-- Quick save
nnoremap { "<Leader>w", ":w<CR>" }

-- Telescope mappings
nnoremap { "<Leader>ff", R("ape.telescope").find_files }
nnoremap { "<Leader>fb", R("ape.telescope").file_browser }
nnoremap { "<Leader>fh", R("telescope.builtin").help_tags }
nnoremap { "<Leader>fg", R("telescope.builtin").live_grep }
nnoremap { "<Leader>fl", R("telescope.builtin").current_buffer_fuzzy_find }
nnoremap { "<Leader>fm", require("telescope").extensions.metals.commands }

-- Navigate the quickfix listing with <C-j> and <C-k>
-- while keeping the cursor centered and opening potential folds
nnoremap { "<C-j>", ":cnext<CR>zzzv" }
nnoremap { "<C-k>", ":cprev<CR>zzzv" }

-- Leave terminal mode with <ESC>
tnoremap { "<ESC>", "<C-\\><C-n>" }

-- Show line diagnostics in a floating window
nnoremap { "<Leader>e", vim.lsp.diagnostic.show_line_diagnostics }
-- Jumps to the definition of the symbol under the cursor
nnoremap { "gd", vim.lsp.buf.definition }
-- Opens a floating window with the definition of the symbol under the cursor
nnoremap { "K", vim.lsp.buf.hover }

-- Opens a quickfix listing with all references to the symbol under the cursor
nnoremap { "gr", vim.lsp.buf.references }
-- Rename the symbol under the cursor
nnoremap { "<Leader>rn", vim.lsp.buf.rename }
-- Show avaiable code actions
nnoremap { "<Leader>a", require("jdtls").code_action }

-- Dap
nnoremap { "<Leader>dc", require"dap".continue }
nnoremap { "<Leader>dr", require"dap".repl.toggle }
nnoremap { "<Leader>dso", require"dap".step_over }
nnoremap { "<Leader>dsi", require"dap".step_into }
nnoremap { "<Leader>dtb", require"dap".toggle_breakpoint }

-- TODO: This does not seem to work
-- map("n", "<Leader>dlp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
