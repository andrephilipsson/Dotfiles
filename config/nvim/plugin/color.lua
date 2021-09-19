local pinnacle = require("wincent.pinnacle")

vim.cmd("colorscheme base16-bright")

-- Make current line nr stand out
vim.cmd("highlight clear CursorLineNr")
vim.cmd("highlight CursorLineNr " .. pinnacle.extract_highlight("DiffText"))

-- Hide end of buffer region
vim.cmd("highlight! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg")

require("gitsigns").setup {
  signs = {
    add          = {hl = "GitSignsAdd"   , text = "│"},
    change       = {hl = "GitSignsChange", text = "│"},
    delete       = {hl = "GitSignsDelete", text = "_"},
    topdelete    = {hl = "GitSignsDelete", text = "‾"},
    changedelete = {hl = "GitSignsChange", text = "~"},
  }
}

-- LSP highlights
vim.fn.sign_define("LspDiagnosticsSignError", { text = "✖" })
vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "⚠" })
vim.fn.sign_define("LspDiagnosticsSignInformation", { text = "ℹ" })
vim.fn.sign_define("LspDiagnosticsSignHint", { text = "➤" })

vim.cmd("highlight LspDiagnosticsSignError " .. pinnacle.highlight({
    bg = pinnacle.extract_bg("ColorColumn"),
    fg = pinnacle.extract_fg("ErrorMsg"),
}))

vim.cmd("highlight LspDiagnosticsSignWarning " .. pinnacle.highlight({
    bg = pinnacle.extract_bg("ColorColumn"),
    fg = pinnacle.extract_fg("Type"),
}))

vim.cmd("highlight LspDiagnosticsSignInformation " .. pinnacle.highlight({
    bg = pinnacle.extract_bg("ColorColumn"),
    fg = pinnacle.extract_fg("Function"),
}))

vim.cmd("highlight LspDiagnosticsSignHint " .. pinnacle.highlight({
    bg = pinnacle.extract_bg("ColorColumn"),
}))

vim.cmd("highlight LspSagaLightBulbSign " .. pinnacle.highlight({
    bg = pinnacle.extract_bg("ColorColumn"),
    fg = pinnacle.extract_fg("Type"),
}))

-- Dap
vim.fn.sign_define("DapBreakpoint", { text="🔴", texthl = "ColorColumn" })
vim.fn.sign_define("DapStopped", { text="🟢", texthl = "ColorColumn" })
