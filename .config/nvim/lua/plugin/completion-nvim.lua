-- Use <Tab> and <S-Tab> to navigate through popup menu
vim.cmd('inoremap <expr> <Tab>   pumvisible() ? "\\<C-n>" : "\\<Tab>"')
vim.cmd('inoremap <expr> <S-Tab> pumvisible() ? "\\<C-p>" : "\\<S-Tab>"')

-- Auto insert parenthesis when completing functions and methods
vim.g.completion_enable_auto_paren = 1

-- Enable Snippets.nvim support
vim.g.completion_enable_snippet = 'snippets.nvim'
