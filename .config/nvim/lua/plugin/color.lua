local pinnacle = require("wincent.pinnacle")

-- Italicize comments
vim.cmd("highlight Comment " .. require'wincent.pinnacle'.italicize("Comment"))

-- Make current line nr stand out
vim.cmd("highlight clear CursorLineNr")
vim.cmd("highlight link CursorLineNr DiffText")


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
    -- fg = pinnacle.extract_fg("ErrorMsg"),
}))

vim.cmd("highlight LspSagaLightBulbSign " .. pinnacle.highlight({
    bg = pinnacle.extract_bg("ColorColumn"),
    -- fg = pinnacle.extract_fg("ErrorMsg"),
}))

-- vim.cmd("highlight LspDiagnosticsError " .. pinnacle.decorate("italic,underline", "ModeMsg"))
-- vim.cmd("highlight LspDiagnosticsWarning " .. pinnacle.decorate("italic,underline", "Type"))
-- vim.cmd("highlight LspDiagnosticsInformation " .. pinnacle.decorate("italic,underline", "Function"))
-- vim.cmd("highlight LspDiagnosticsHint " .. pinnacle.decorate("italic,underline", "ModeMsg"))

-- Dap
vim.fn.sign_define("DapBreakpoint", { text="🔴", texthl = "ColorColumn" })
vim.fn.sign_define("DapStopped", { text="🟢", texthl = "ColorColumn" })
