local actions = require("telescope.actions")

require("telescope").setup {
  defaults = {
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    file_ignore_patterns = {
      "node_modules/*",
      ".git/*",
      "%.class",
      "%.pdf",
      "%.png",
      "target/",
      ".bloop/"
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous
      }
    }
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true
    },
    ["ui-select"] = {
      require("telescope.themes").get_ivy()
    }
  }
}

require("telescope").load_extension("fzy_native")
require("telescope").load_extension("ui-select")


local M = {}

M.find_files = function()
  require("telescope.builtin").find_files(require("telescope.themes").get_ivy({
    hidden = true,
  }))
end

M.help_tags = function()
  require("telescope.builtin").help_tags(require("telescope.themes").get_ivy())
end

M.man_pages = function()
  require("telescope.builtin").man_pages(require("telescope.themes").get_ivy())
end

M.current_buffer_fuzzy_find = function()
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_ivy())
end

M.live_grep = function()
  require("telescope.builtin").live_grep(require("telescope.themes").get_ivy())
end

return M
