-- Auto insert parenthesis when completing functions and methods
vim.g.completion_enable_auto_paren = 1

-- Enable Snippets.nvim support
vim.g.completion_enable_snippet = 'snippets.nvim'

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use <Tab> and <S-Tab> to:
-- - Move to prev/next completion item
-- - Jump to prev/next snippet's placeholder
-- - Trigger completion
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  elseif require'snippets'.has_active_snippet() then
    return t "<Cmd>lua SNIPPETS_FLOATY_HANDLER(1)<cr>"
  else
    return t "<Plug>(completion_trigger)"
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif require'snippets'.has_active_snippet() then
    return t "<Cmd>lua SNIPPETS_FLOATY_HANDLER(-1)<cr>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
