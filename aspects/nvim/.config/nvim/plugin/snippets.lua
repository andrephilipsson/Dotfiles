local has_ls, ls = pcall(require, "luasnip")
if not has_ls then
  return
end

local types = require("luasnip.util.types")

ls.config.set_config({
  history = false,
  updateevents = "TextChanged, TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "<-", "Error" } },
      },
    },
  },
})

vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })
