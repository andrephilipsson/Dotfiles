" Cycle through completions with <Ctrl-j> and <Ctrl-k>
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr><Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-j>"
inoremap <expr><Up> pumvisible() ? "\<C-p>" : "\<Up>"

" Close documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
