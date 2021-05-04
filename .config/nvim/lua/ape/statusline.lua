require("lualine").setup{
  options = {
    theme = "seoul256",
    section_separators = {"", ""},
    component_separators = {"", ""},
    icons_enabled = true,
  },
  sections = {
    lualine_a = { {"mode", upper = true} },
    lualine_b = { {"branch", icon = ""} },
    -- FIXME: Wan't to enable this, but startuptime increases by 250ms when doing so.
    -- lualine_c = {
    --   {"filename", file_status = true},
    --   { "vim.g['metals_status']" },
    lualine_c = { {"filename", file_status = true} },
    lualine_x = { "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {  },
    lualine_b = {  },
    lualine_c = { "filename" },
    lualine_x = {  },
    lualine_y = {  },
    lualine_z = {  }
  }
}
