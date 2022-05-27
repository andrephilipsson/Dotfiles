local ok, telescope = pcall(require, "telescope")
if not ok then
  return
end

local themes = require("telescope.themes")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    file_ignore_patterns = {
      "%.git/*",
      ".DS_Store",
      "node_modules/*",
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
  },
  pickers = {},
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
})

telescope.load_extension("fzy_native")

local M = {}

M.find_files = function()
  builtin.find_files(themes.get_ivy({
    hidden = true,
  }))
end

M.help_tags = function()
  builtin.help_tags(themes.get_ivy())
end

M.man_pages = function()
  builtin.man_pages(themes.get_ivy())
end

M.current_buffer_fuzzy_find = function()
  builtin.current_buffer_fuzzy_find(themes.get_ivy())
end

M.live_grep = function()
  builtin.live_grep(themes.get_ivy())
end

vim.keymap.set("n", "<Leader>ff", M.find_files)
vim.keymap.set("n", "<Leader>fh", M.help_tags)
vim.keymap.set("n", "<Leader>fg", M.live_grep)
vim.keymap.set("n", "<Leader>fm", M.man_pages)
vim.keymap.set("n", "<Leader>fl", M.current_buffer_fuzzy_find)

-- return M
