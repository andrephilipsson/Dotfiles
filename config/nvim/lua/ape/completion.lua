local luasnip = require('luasnip')

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
  elseif luasnip and luasnip.expand_or_jumpable() then
    return t "<Plug>luasnip-expand-or-jump"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif luasnip and luasnip.jumpable(-1) then
    return t "<Plug>luasnip-jump-prev"
  else
    return t "<S-Tab>"
  end
end


require"compe".setup {
  enabled = true,
  min_length = 1,
  preselect = "always",

  source = {
    path = true,
    buffer = true,
    calc = false,
    nvim_lua = true,
    vsnip = false,
    snippets_nvim = false,
    -- luasnip = true,
    emoji = true,
    nvim_lsp = {
      priority = 1000
    },
    luasnip = {
      priority = 2000
    },
  }
}
