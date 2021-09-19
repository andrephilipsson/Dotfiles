local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", true)
end

local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup {
  mapping = {
    ["<CR>"] = cmp.mapping.confirm(),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif vim.fn.pumvisible() == 1 then
        feedkey("<C-n>")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends an already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      elseif vim.fn.pumvisible() == 1 then
        feedkey("<C-p>")
      else
        fallback()
      end
    end, { "i", "s" }),
  },

  snippet = {
    expand = function(args)
      require"luasnip".lsp_expand(args.body)
    end
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
    { name = "nvim_lua" },
    { name = "latex_symbols" },
    { name = "spell" },
    { name = "emoji" },
  }
}
