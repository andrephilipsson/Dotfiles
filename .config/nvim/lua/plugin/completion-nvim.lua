local inoremap = vim.keymap.inoremap

-- Use <Tab> and <S-Tab> to navigate through popup menu
inoremap { "<Tab>", "pumvisible() ? ' '\\<C-n>' : '\\<Tab>'", { expr = true } }
inoremap { "<S-Tab>", "pumvisible() ? '\\<C-p>' : '\\<S-Tab>'", { expr = true } }

-- Auto insert parenthesis when completing functions and methods
vim.g.completion_enable_auto_paren = 1

-- Enable UltiSnips support
vim.g.completion_enable_snippet = 'UltiSnips'
