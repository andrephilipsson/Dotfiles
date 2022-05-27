local ok, material = pcall(require, "material")
if not ok then
  return
end

-- vim.opt.background = "dark"
-- vim.g.material_style = "deep ocean"
vim.opt.background = "light"
vim.g.material_style = "lighter"

material.setup({
  contrast = {
    sidebars = false,
    floating_windows = false,
    line_numbers = false,
    sign_column = false,
    cursor_line = false,
    non_current_windows = false,
    popup_menu = false,
  },

  italics = {
    comments = true,
    keywords = false,
    functions = false,
    strings = false,
    variables = false,
  },

  contrast_filetypes = {
    "terminal",
    "packer",
    "qf",
  },

  disable = {
    borders = false,
    background = false,
    term_colors = false,
    eob_lines = true,
  },

  lualine_style = "default",

  async_loading = true,

  custom_highlights = {},
})

vim.cmd("colorscheme material")
