" Make 'Y' yank the rest of the line
nnoremap Y y$

" Open and close folds with tab
nnoremap <Tab> za

" Telescope mappings
nnoremap <leader>ff <cmd> lua R('ape.telescope').find_files()<CR>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua R('ape.telescope').file_browser()<CR>
nnoremap <leader>fo <cmd>lua require('telescope.builtin').vim_options()<cr>
nnoremap <leader>fd <cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>
nnoremap <leader>fl <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>

" Navigate the quickfix list with <C-j> and <C-k>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
