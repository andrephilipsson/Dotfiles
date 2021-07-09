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
    return t "<cmd>call compe#complete()<cr>"
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


require"compe".setup {
  enabled = true,
  min_length = 1,

  source = {
    path = true,
    buffer = true,
    calc = false,
    nvim_lua = true,
    vsnip = false,
    snippets_nvim = true,
    emoji = true,
    nvim_lsp = {
      priority = 1000
    },
  }
}
