local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require("cmp")
local lspkind = require("lspkind")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

-- Insert "()" after selecting a function or method
cmp.event:on( "confirm_done", cmp_autopairs.on_confirm_done({  map_char = { tex = "" } }))

cmp.setup {
  mapping = {
    ["<CR>"] = cmp.mapping.confirm({ select = true }),

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "buffer", keyword_length = 5 },
  },
  formatting = {
    format = lspkind.cmp_format {
      with_text = true
    }
  },
  experimental = {
    ghost_text = true,
  },
}
