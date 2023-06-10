local has_material, material = pcall(require, "material")

if not has_material then
  return
end

vim.g.material_style = "lighter"
-- vim.g.material_style = "deep ocean"

material.setup({
  contrast = {},
  styles = {
    comments = { italic = true },
    strings = {},
    keywords = {},
    functions = {},
    variables = {},
    operators = {},
    types = {},
  },
  disable = {
    eob_lines = false,
  },
  plugins = {
    "nvim-cmp",
    "nvim-web-devicons",
    "gitsigns",
    "indent-blankline",
    "nvim-tree",
    "telescope",
  },
  lualine_style = "default",
  async_loading = true,
})

-- Should be last
vim.opt.termguicolors = true
vim.cmd("colorscheme material")
