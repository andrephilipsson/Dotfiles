" Make 'Y' yank the rest of the line
nnoremap Y y$

" Open and close folds with tab
nnoremap <Tab> za

" Easier navigation between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>ff <cmd> lua require('telescope.builtin').find_files { hidden = true }<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').file_browser { hidden = true }<cr>
nnoremap <leader>fc <cmd>lua require('telescope.builtin').commands()<cr>
nnoremap <leader>fo <cmd>lua require('telescope.builtin').vim_options()<cr>
nnoremap <leader>fd <cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>
nnoremap <leader>fl <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
