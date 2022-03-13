local pinnacle = require("wincent.pinnacle")

vim.cmd("colorscheme base16-bright")

local signs = { Error = "✖ ", Warn = "⚠ ", Hint = "➤ ", Info = "ℹ " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- make current line nr stand out
vim.cmd("highlight clear CursorLineNr")
vim.cmd("highlight CursorLineNr " .. pinnacle.extract_highlight("DiffText"))

-- hide end of buffer region
vim.cmd("highlight! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg")

-- remove background color from gutter
vim.cmd("highlight SignColumn " .. pinnacle.highlight({
  bg = pinnacle.extract_bg("Normal"),
}))

vim.cmd("highlight CursorLineNr " .. pinnacle.highlight({
  bg = pinnacle.extract_bg("Normal"),
}))

vim.cmd("highlight LineNr " .. pinnacle.highlight({
  bg = pinnacle.extract_bg("Normal"),
}))
