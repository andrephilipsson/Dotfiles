local ok, lualine = pcall(require, "lualine")
if not ok then
  return
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "material-nvim",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diagnostics" },
    lualine_c = {
      {
        "filename",
        path = 1,
        -- TODO: want to make the just the filename bold
        symbols = {
          modified = "[+]", -- Text to show when the file is modified.
          readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
          unnamed = "",
        },
      },
    },
    lualine_x = { "filetype" },
    lualine_y = {},
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
})
