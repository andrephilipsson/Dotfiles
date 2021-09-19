local map = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- Make "Y" yank the rest of the line
map("n", "Y", "y$")

-- Open and close folds with Tab
map("n", "<Tab>", "za")

-- Telescope mappings
map("n", "<Leader>ff", "<cmd>lua R('ape.telescope').find_files()<CR>")
map("n", "<Leader>fb", "<cmd>lua R('ape.telescope').file_browser()<CR>")
map("n", "<Leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>")
map("n", "<Leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
map("n", "<Leader>fl", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>")

-- Navigate the quickfix listing with <C-j> and <C-k>
map("n", "<C-j>", ":cnext<CR>")
map("n", "<C-k>", ":cprev<CR>")

-- Leave terminal mode with <ESC>
map("t", "<ESC>", "<C-\\><C-n>")

-- TODO: Fix this so that we don't get error when we don't have any selections
-- active. Use require'luasnip'.choice_active()
map("i", "<C-E>", "<cmd>lua require'luasnip'.change_choice(1)<CR>", {})
map("s", "<C-E>", "<cmd>lua require'luasnip'.change_choice(-1)<CR>", {})

-- Show line diagnostics in a floating window
map("n", "<Leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
-- Jumps to the definition of the symbol under the cursor
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
-- Opens a floating window with the definition of the symbol under the cursor
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")

-- Opens a quickfix listing with all references to the symbol under the cursor
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
-- Rename the symbol under the cursor
map("n", "<Leader>rn", "<cmd>lua require('lspsaga.rename').rename()<CR>")
-- Show avaiable code actions
-- map("n", "<Leader>a", "<cmd>lua require('lspsaga.codeaction').code_action()<CR>")
-- TODO: Make this work with lspsaga
map("n", "<Leader>a", "<cmd>lua require('jdtls').code_action()<CR>")

-- Dap
map("n", "<Leader>dc", ":lua require'dap'.continue()<CR>")
map("n", "<Leader>dr", ":lua require'dap'.repl.toggle()<CR>")
map("n", "<Leader>dso", ":lua require'dap'.step_over()<CR>")
map("n", "<Leader>dsi", ":lua require'dap'.step_into()<CR>")
map("n", "<Leader>dtb", ":lua require'dap'.toggle_breakpoint()<CR>")
-- TODO: This does not seem to work
-- map("n", "<Leader>dlp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
