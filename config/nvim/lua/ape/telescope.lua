local actions = require("telescope.actions")

require("telescope").setup{
  defaults = {
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    file_ignore_patterns = { "node_modules/" },
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
    }
  }
}

require("telescope").load_extension("fzy_native")


local M = {}

M.find_files = function()
  require("telescope.builtin").find_files({
    hidden = true
  })
end

M.file_browser = function()
  require("telescope.builtin").file_browser({
    hidden = true,
  })
end

return M
