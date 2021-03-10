" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Auto insert parenthesis when completing functions and methods
lua vim.g.completion_enable_auto_paren = 1

" Enable UltiSnips support
lua vim.g.completion_enable_snippet = 'UltiSnips'

" Enable the plugin in all buffers
" Required for enabling snippets and path completion
autocmd BufEnter * lua require'completion'.on_attach()
