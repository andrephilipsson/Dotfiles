local ok, material = pcall(require, "material")
if not ok then
  return
end

--[[ vim.opt.background = "dark" ]]
--[[ vim.g.material_style = "deep ocean" ]]
vim.opt.background = "light"
vim.g.material_style = "lighter"

material.setup({
  contrast = {
    terminal = false, -- Enable contrast for the built-in terminal
    sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
    floating_windows = false, -- Enable contrast for floating windows
    cursor_line = false, -- Enable darker background for the cursor line
    non_current_windows = false, -- Enable darker background for non-current windows
    filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
  },

  styles = { -- Give comments style such as bold, italic, underline etc.
    comments = { italic = true },
    strings = { --[[ bold = true ]]
    },
    keywords = { --[[ underline = true ]]
    },
    functions = { --[[ bold = true, undercurl = true ]]
    },
    variables = {},
    operators = {},
    types = {},
  },

  plugins = { -- Uncomment the plugins that you use to highlight them
    "gitsigns",
    "indent-blankline",
    "nvim-cmp",
    "nvim-tree",
  },

  disable = {
    colored_cursor = false, -- Disable the colored cursor
    borders = false, -- Disable borders between verticaly split windows
    background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
    term_colors = false, -- Prevent the theme from setting terminal colors
    eob_lines = true, -- Hide the end-of-buffer lines
  },

  high_visibility = {
    lighter = true, -- Enable higher contrast text for lighter style
    darker = true, -- Enable higher contrast text for darker style
  },

  lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )

  async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

  custom_colors = nil, -- If you want to override the default colors, set this to a function

  custom_highlights = {}, -- Overwrite highlights with your own
})

vim.cmd("colorscheme material")
