vim.cmd('imap <tab> <Plug>(completion_smart_tab)')
vim.cmd('imap <s-tab> <Plug>(completion_smart_s_tab)')

-- Auto insert parenthesis when completing functions and methods
vim.g.completion_enable_auto_paren = 1

-- Enable Snippets.nvim support
vim.g.completion_enable_snippet = 'snippets.nvim'
