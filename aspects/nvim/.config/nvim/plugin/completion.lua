local has_cmp, cmp = pcall(require, "cmp")
if not has_cmp then
  return
end

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

cmp.setup({
  formatting = {
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
      -- Source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[LaTeX]",
      })[entry.source.name]
      return vim_item
    end,
  },

  view = {
    entries = "custom",
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  }),

  experimental = {
    ghost_text = false,
  },

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
    { name = "buffer", keyword_length = 5 },
  }),

  cmp.setup.filetype("markdown", {
    sources = {
      { name = "emoji" },
    },
  }),

  cmp.setup.filetype("lua", {
    sources = {
      { name = "nvim_lua" },
    },
  }),

  cmp.setup.filetype({ "markdown", "text", "gitcommit", "help" }, {
    sources = {
      { name = "spell", keyword_length = 5 },
    },
  }),

  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      {
        name = "cmdline",
        keyword_length = 3,
        max_item_count = 5,
      },
    }),
  }),

  cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "buffer" },
    }),
  }),
})

local has_autopairs, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not has_autopairs then
  return
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
