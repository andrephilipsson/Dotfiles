require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', linehl='GitSignsChangeLn'},
  }
}
