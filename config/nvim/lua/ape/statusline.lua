require("lualine").setup{
  options = {
    theme = "auto",
    icons_enabled = true,
  },
  sections = {
    lualine_a = { {"mode", upper = false} },
    lualine_b = { },
    lualine_c = {
      {"filename", file_status = true},
      { "vim.g['metals_status']" },
    },
    lualine_x = { "filetype" },
    lualine_y = { },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = { },
    lualine_b = { },
    lualine_c = { "filename" },
    lualine_x = { },
    lualine_y = { },
    lualine_z = { }
  }
}
